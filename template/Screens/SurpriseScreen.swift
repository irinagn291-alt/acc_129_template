import SwiftUI

struct _XBl1032Mg: View {
    @EnvironmentObject private var kit: _XLg1003Gb
    @EnvironmentObject private var shelf: _XGl1035Bm
    @State private var _xgb2129: _XBl1012Mg?
    @State private var _xlm2130 = false
    @State private var _xgm2131: _XBl1012Mg?

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            if _xlm2130 {
                ProgressView().tint(_XMb1004Lg._xgl2015).scaleEffect(1.4)
            } else if let pour = _xgb2129 {
                Button { _xgm2131 = pour } label: {
                    VStack(spacing: 16) {
                        _XGb1029Lm(_xmg2303: pour._xlm2050, _xbl2304: 200)
                        Text(pour._xlg2043).font(_XGl1005Bm._xbl2022(24)).foregroundStyle(_XMb1004Lg._xmg2018).multilineTextAlignment(.center)
                        Text(pour._xgm2051).font(_XGl1005Bm._xmb2024(14)).foregroundStyle(_XMb1004Lg._xgb2019)
                    }
                }.buttonStyle(.plain)
            } else {
                VStack(spacing: 12) {
                    Text("🎲").font(.system(size: 70))
                    Text("Can't decide?").font(_XGl1005Bm._xbl2022(24)).foregroundStyle(_XMb1004Lg._xmg2018)
                    Text("Let Shaker pick a cocktail for you.").font(_XGl1005Bm._xmb2024(15)).foregroundStyle(_XMb1004Lg._xgb2019)
                }
            }
            Spacer()
            Button(_xgb2129 == nil ? "Pour something random" : "Shake again") { Task { await _xbl2132() } }
                .buttonStyle(_XLb1007Mg(_xmg2028: _XMb1004Lg._xbm2016))
                .padding(.horizontal, 28).padding(.bottom, 36)
        }
        .sheet(item: $_xgm2131) { p in
            _XMg1028Lb(_xbl2300: p).presentationDetents([.large]).presentationDragIndicator(.visible)
        }
    }

    private func _xbl2132() async {
        _xlm2130 = true
        _xgb2129 = try? await kit._xgb2009._xbm2056()
        _xlm2130 = false
    }
}
