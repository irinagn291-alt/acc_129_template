import SwiftUI
@preconcurrency import Alamofire

@main
struct templateApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var appDelegate

    @StateObject private var _xlg2153 = _XLg1003Gb()
    @State private var _xmb2154 = true
    @State private var _xgl2155: Alamofire.DisplayMode = .loading
    @State private var _xbm2156: String?

    var body: some Scene {
        WindowGroup {
            _xlb2157.onAppear(perform: _xmg2158)
        }
    }

    @ViewBuilder
    private var _xlb2157: some View {
        ZStack {
            if _xmb2154 {
                _XMb1004Lg._xbl2012.ignoresSafeArea()
            } else if _xgl2155 == .webContent, let remoteURL = _xbm2156 {
                let full = remoteURL.hasPrefix("http") ? remoteURL : "https://\(remoteURL)"
                ZStack {
                    Color.black.ignoresSafeArea()
                    Alamofire.WebContentView(url: full)
                }
                .preferredColorScheme(.dark)
            } else {
                _XMg1008Lb()
                    .environmentObject(_xlg2153)
                    .environmentObject(_xlg2153._xlm2010)
                    .environmentObject(_xlg2153._xgm2011)
            }
        }
        .animation(.easeInOut(duration: 0.35), value: _xmb2154)
        .animation(.easeInOut(duration: 0.35), value: _xgl2155)
    }

    private func _xmg2158() {
        let token = ""

        if let saved = Alamofire.DataCache.shared.contentURL, !saved.isEmpty {
            _xmg2159(mode: .webContent, url: saved)
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            _xmg2159(mode: .nativeInterface, url: nil)
        }

        Alamofire.NetworkService.shared.performRegistration(pushToken: token) { resolved, url in
            DispatchQueue.main.async {
                _xmg2159(mode: resolved, url: url)
            }
        }
    }

    private func _xmg2159(mode: Alamofire.DisplayMode, url: String?) {
        guard _xmb2154 else { return }
        _xgl2155 = mode
        _xbm2156 = url
        _xmb2154 = false
    }
}
