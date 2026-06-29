import SwiftUI

struct _XLg1033Gb: View {
    @EnvironmentObject private var lounge: _XBl1002Mg
    @State private var _xlg2133 = 0

    private let _xmb2134: [_XMb1034Lg] = [
        _XMb1034Lg(_xmg2138: "🍸", _xgb2139: _XMb1004Lg._xgl2015, _xlm2140: "Find any cocktail",
                _xgm2141: "Search thousands of recipes by name or by what's already on your shelf."),
        _XMb1034Lg(_xmg2138: "🎲", _xgb2139: _XMb1004Lg._xbm2016, _xlm2140: "Feeling lucky?",
                _xgm2141: "Tap Surprise for a random pour when you can't decide what to mix."),
        _XMb1034Lg(_xmg2138: "🧉", _xgb2139: _XMb1004Lg._xlb2017, _xlm2140: "Build your home bar",
                _xgm2141: "Save what you've shaken and what you still want to try — rate and tweak each one."),
        _XMb1034Lg(_xmg2138: "⭐️", _xgb2139: _XMb1004Lg._xgl2015, _xlm2140: "Keep the classics close",
                _xgm2141: "Star your favourites so the go-to round is always one tap away.")
    ]

    var body: some View {
        VStack(spacing: 0) {
            HStack { Spacer(); Button("Skip") { lounge._xlb2007() }.font(_XGl1005Bm._xgl2025(15)).foregroundStyle(_XMb1004Lg._xgb2019).padding() }
            Spacer()
            _xgl2135
            Spacer()
            _xlb2137
            Button(_xlg2133 == _xmb2134.count - 1 ? "Step up to the bar" : "Next") {
                if _xlg2133 == _xmb2134.count - 1 { lounge._xlb2007() }
                else { withAnimation(.spring(response: 0.4, dampingFraction: 0.7)) { _xlg2133 += 1 } }
            }
            .buttonStyle(_XLb1007Mg())
            .padding(.horizontal, 28).padding(.bottom, 40)
        }
        .background(_XMb1004Lg._xbl2012)
    }

    private var _xgl2135: some View {
        ZStack {
            ForEach(Array(_xmb2134.enumerated()), id: \.offset) { idx, coaster in
                if idx >= _xlg2133 && idx <= _xlg2133 + 2 {
                    let depth = idx - _xlg2133
                    _xbm2136(coaster)
                        .scaleEffect(1 - CGFloat(depth) * 0.05)
                        .offset(y: CGFloat(depth) * 16)
                        .opacity(depth == 0 ? 1 : 0.5)
                        .zIndex(Double(_xmb2134.count - depth))
                }
            }
        }
        .frame(height: 380)
        .padding(.horizontal, 30)
    }

    private func _xbm2136(_ c: _XMb1034Lg) -> some View {
        VStack(spacing: 22) {
            Text(c._xmg2138).font(.system(size: 80))
            VStack(spacing: 12) {
                Text(c._xlm2140).font(_XGl1005Bm._xbl2022(26)).multilineTextAlignment(.center).foregroundStyle(_XMb1004Lg._xmg2018)
                Text(c._xgm2141).font(_XGl1005Bm._xmb2024(16)).multilineTextAlignment(.center).foregroundStyle(_XMb1004Lg._xgb2019).lineSpacing(4)
            }
        }
        .padding(30)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(RoundedRectangle(cornerRadius: _XBm1006Gl._xbm2026, style: .continuous).fill(_XMb1004Lg._xlg2013))
        .overlay(RoundedRectangle(cornerRadius: _XBm1006Gl._xbm2026).strokeBorder(c._xgb2139, lineWidth: 3))
    }

    private var _xlb2137: some View {
        HStack(spacing: 8) {
            ForEach(0..<_xmb2134.count, id: \.self) { i in
                Circle().fill(i == _xlg2133 ? _XMb1004Lg._xgl2015 : _XMb1004Lg._xlm2020)
                    .frame(width: i == _xlg2133 ? 10 : 8, height: i == _xlg2133 ? 10 : 8)
            }
        }
        .padding(.bottom, 18)
    }
}

private struct _XMb1034Lg {
    let _xmg2138: String
    let _xgb2139: Color
    let _xlm2140: String
    let _xgm2141: String
}
