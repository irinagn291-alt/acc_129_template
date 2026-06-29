import SwiftUI

enum _XGb1019Lm: CaseIterable {
    case _xlb2077, _xmg2078, _xgb2079, _xlm2080, _xgm2081
    var _xbl2082: String {
        switch self {
        case ._xlb2077: return "Discover"
        case ._xmg2078: return "Surprise me"
        case ._xgb2079: return "My bar"
        case ._xlm2080: return "Favorites"
        case ._xgm2081: return "About"
        }
    }
    var _xlg2083: String {
        switch self {
        case ._xlb2077: return "magnifyingglass"
        case ._xmg2078: return "dice.fill"
        case ._xgb2079: return "cabinet.fill"
        case ._xlm2080: return "star.fill"
        case ._xgm2081: return "info.circle.fill"
        }
    }
}

struct _XLm1020Gb: View {
    @State private var _xmb2084: _XGb1019Lm = ._xlb2077
    @State private var _xgl2085 = false

    var body: some View {
        ZStack(alignment: .leading) {
            _xbm2086
                .overlay(_xgl2085 ? Color.black.opacity(0.35).ignoresSafeArea() : nil)
                .disabled(_xgl2085)
                .onTapGesture { if _xgl2085 { withAnimation { _xgl2085 = false } } }

            if _xgl2085 { _xmg2088.transition(.move(edge: .leading)) }
        }
        .gesture(
            DragGesture().onEnded { v in
                if v.translation.width > 60 { withAnimation { _xgl2085 = true } }
                if v.translation.width < -60 { withAnimation { _xgl2085 = false } }
            }
        )
    }

    private var _xbm2086: some View {
        VStack(spacing: 0) {
            HStack(spacing: 12) {
                Button { withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) { _xgl2085.toggle() } } label: {
                    Image(systemName: "line.3.horizontal")
                        .font(.system(size: 20, weight: .bold)).foregroundStyle(_XMb1004Lg._xmg2018)
                }
                Text(_xmb2084._xbl2082).font(_XGl1005Bm._xbl2022(24)).foregroundStyle(_XMb1004Lg._xmg2018)
                Spacer()
            }
            .padding(.horizontal, 20).padding(.top, 14).padding(.bottom, 8)

            _xlb2087
        }
        .background(_XMb1004Lg._xbl2012.ignoresSafeArea())
    }

    @ViewBuilder
    private var _xlb2087: some View {
        switch _xmb2084 {
        case ._xlb2077: _XGm1021Bl()
        case ._xmg2078: _XBl1032Mg()
        case ._xgb2079: _XGl1025Bm()
        case ._xlm2080: _XBm1026Gl()
        case ._xgm2081: _XBm1016Gl()
        }
    }

    private var _xmg2088: some View {
        VStack(alignment: .leading, spacing: 6) {
            HStack(spacing: 10) {
                ZStack { Circle().fill(_XMb1004Lg._xgl2015).frame(width: 44, height: 44); Image(systemName: "wineglass.fill").foregroundStyle(.white) }
                VStack(alignment: .leading) {
                    Text("Shaker").font(_XGl1005Bm._xbl2022(22)).foregroundStyle(_XMb1004Lg._xmg2018)
                    Text("home bar").font(_XGl1005Bm._xgl2025(12)).foregroundStyle(_XMb1004Lg._xgb2019)
                }
            }
            .padding(.bottom, 24).padding(.top, 60)

            ForEach(_XGb1019Lm.allCases, id: \.self) { r in
                Button {
                    withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) { _xmb2084 = r; _xgl2085 = false }
                } label: {
                    HStack(spacing: 14) {
                        Image(systemName: r._xlg2083).frame(width: 26).foregroundStyle(_xmb2084 == r ? .white : _XMb1004Lg._xgl2015)
                        Text(r._xbl2082).font(_XGl1005Bm._xlg2023(16)).foregroundStyle(_xmb2084 == r ? .white : _XMb1004Lg._xmg2018)
                        Spacer()
                    }
                    .padding(.horizontal, 16).padding(.vertical, 14)
                    .background(RoundedRectangle(cornerRadius: _XBm1006Gl._xlb2027).fill(_xmb2084 == r ? _XMb1004Lg._xgl2015 : .clear))
                }
            }
            Spacer()
        }
        .padding(.horizontal, 16)
        .frame(width: 270)
        .frame(maxHeight: .infinity)
        .background(_XMb1004Lg._xlg2013.ignoresSafeArea())
        .shadow(color: .black.opacity(0.15), radius: 20, x: 6)
    }
}
