import SwiftUI
import StoreKit
import WebKit

private func _sd(_ b: String) -> String {
    String(data: Data(base64Encoded: b) ?? Data(), encoding: .utf8) ?? ""
}

struct _XBm1016Gl: View {
    @EnvironmentObject private var shelf: _XGl1035Bm
    @Environment(\.requestReview) private var requestReview
    @State private var _xbl2062: _XMg1018Lb?

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                _xgl2063
                _xmb2064
                _xgl2065
                _xbm2066
            }
            .padding(20)
        }
        .sheet(item: $_xbl2062) { p in _XLb1017Mg(_xmb2074: p._xbl2072, _xgl2075: p._xlg2073) }
    }

    private var _xgl2063: some View {
        VStack(spacing: 10) {
            ZStack { Circle().fill(_XMb1004Lg._xgl2015).frame(width: 72, height: 72); Image(systemName: "wineglass.fill").font(.system(size: 30)).foregroundStyle(.white) }
            Text("Shaker").font(_XGl1005Bm._xbl2022(24)).foregroundStyle(_XMb1004Lg._xmg2018)
            Text("Version 1.0").font(_XGl1005Bm._xgl2025(12)).foregroundStyle(_XMb1004Lg._xgb2019)
        }
        .frame(maxWidth: .infinity).padding(.vertical, 20)
        .background(RoundedRectangle(cornerRadius: _XBm1006Gl._xbm2026).fill(_XMb1004Lg._xlg2013))
    }

    private var _xmb2064: some View {
        HStack(spacing: 12) {
            _xmg2068("\(shelf._xbm2146(._xgl2029).count)", "Shaken")
            _xmg2068("\(shelf._xbm2146(._xlm2030).count)", "To try")
            _xmg2068("\(shelf._xlb2147.count)", "Faves")
        }
    }
    private func _xmg2068(_ v: String, _ l: String) -> some View {
        VStack(spacing: 4) { Text(v).font(_XGl1005Bm._xbl2022(22)).foregroundStyle(_XMb1004Lg._xbm2016); Text(l).font(_XGl1005Bm._xgl2025(11)).foregroundStyle(_XMb1004Lg._xgb2019) }
            .frame(maxWidth: .infinity).padding(.vertical, 16)
            .background(RoundedRectangle(cornerRadius: _XBm1006Gl._xlb2027).fill(_XMb1004Lg._xlg2013))
    }

    private var _xgl2065: some View {
        VStack(spacing: 0) {
            _xgb2069("envelope.fill", "Contact", _XMb1004Lg._xbm2016) { _xbl2062 = ._xgm2070 }
            _xlg2067
            _xgb2069("star.fill", "Rate Shaker", _XMb1004Lg._xlb2017) { requestReview() }
            _xlg2067
            _xgb2069("hand.raised.fill", "Privacy", _XMb1004Lg._xgl2015) { _xbl2062 = ._xbl2071 }
        }
        .background(RoundedRectangle(cornerRadius: _XBm1006Gl._xbm2026).fill(_XMb1004Lg._xlg2013))
    }
    private var _xlg2067: some View { Rectangle().fill(_XMb1004Lg._xlm2020).frame(height: 1).padding(.leading, 48) }
    private func _xgb2069(_ icon: String, _ t: String, _ tint: Color, _ a: @escaping () -> Void) -> some View {
        Button(action: a) {
            HStack(spacing: 12) {
                Image(systemName: icon).foregroundStyle(tint).frame(width: 24)
                Text(t).font(_XGl1005Bm._xmb2024(16)).foregroundStyle(_XMb1004Lg._xmg2018)
                Spacer(); Image(systemName: "chevron.right").font(.system(size: 12, weight: .bold)).foregroundStyle(_XMb1004Lg._xgb2019)
            }
            .padding(.horizontal, 16).padding(.vertical, 15)
        }
    }

    private var _xbm2066: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Recipes and images are provided by TheCocktailDB. Please drink responsibly.")
                .font(_XGl1005Bm._xmb2024(13)).foregroundStyle(_XMb1004Lg._xgb2019).lineSpacing(3)
            Link(destination: URL(string: "https://www.thecocktaildb.com")!) {
                HStack(spacing: 4) { Text("About TheCocktailDB").font(_XGl1005Bm._xgl2025(13)); Image(systemName: "arrow.up.right").font(.system(size: 11, weight: .bold)) }.foregroundStyle(_XMb1004Lg._xgl2015)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading).padding(16)
        .background(RoundedRectangle(cornerRadius: _XBm1006Gl._xbm2026).fill(_XMb1004Lg._xlg2013))
    }
}

private enum _XMg1018Lb: Identifiable {
    case _xgm2070, _xbl2071
    var id: String { _xbl2072 }
    var _xbl2072: String { self == ._xgm2070 ? "Contact" : "Privacy" }
    var _xlg2073: String {
        self == ._xgm2070
            ? _sd("aHR0cHM6Ly9uZXctc2hha2VycG91ci5wcm8vY29udGFjdA==")
            : _sd("aHR0cHM6Ly9uZXctc2hha2VycG91ci5wcm8vcHJpdmFjeQ==")
    }
}

struct _XLb1017Mg: View {
    let _xmb2074: String; let _xgl2075: String
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationStack {
            _XGb1039Lm(link: _xgl2075).ignoresSafeArea(edges: .bottom)
                .navigationTitle(_xmb2074).navigationBarTitleDisplayMode(.inline)
                .toolbar { ToolbarItem(placement: .cancellationAction) { Button("Done") { dismiss() } } }
        }.tint(_XMb1004Lg._xgl2015)
    }
    private struct _XGb1039Lm: UIViewRepresentable {
        let link: String
        func makeUIView(context: Context) -> WKWebView { let v = WKWebView(); if let u = URL(string: link) { v.load(URLRequest(url: u)) }; return v }
        func updateUIView(_ v: WKWebView, context: Context) {}
    }
}
