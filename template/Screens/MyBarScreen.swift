import SwiftUI

struct _XGl1025Bm: View {
    @EnvironmentObject private var shelf: _XGl1035Bm
    @State private var _xgb2109: _XGb1009Lm?
    @State private var _xlm2110: _XBl1012Mg?

    var body: some View {
        VStack(spacing: 12) {
            _xgm2111
            _xlg2113
        }
        .sheet(item: $_xlm2110) { p in
            _XMg1028Lb(_xbl2300: p).presentationDetents([.large]).presentationDragIndicator(.visible)
        }
    }

    private var _xgm2111: some View {
        HStack(spacing: 8) {
            _xbl2112(nil, "All")
            ForEach(_XGb1009Lm.allCases) { i in _xbl2112(i, i._xbm2026) }
            Spacer()
        }
        .padding(.horizontal, 20)
    }
    private func _xbl2112(_ v: _XGb1009Lm?, _ label: String) -> some View {
        let on = _xgb2109 == v
        return Button { withAnimation { _xgb2109 = v } } label: {
            Text(label).font(_XGl1005Bm._xgl2025(13)).foregroundStyle(on ? .white : _XMb1004Lg._xmg2018)
                .padding(.horizontal, 16).padding(.vertical, 9)
                .background(Capsule().fill(on ? _XMb1004Lg._xgl2015 : _XMb1004Lg._xmb2014))
        }
    }

    @ViewBuilder
    private var _xlg2113: some View {
        let rows = (_xgb2109 == nil ? shelf._xbl2142 : shelf._xbm2146(_xgb2109!))
        if rows.isEmpty {
            Spacer(); _XGm1031Bl(_xmg2305: "cabinet", _xbl2306: "Your bar's empty", _xmg2307: "Save cocktails you've made or want to try and they'll line up here."); Spacer()
        } else {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(rows) { card in
                        Button { _xlm2110 = card._xlg2033 } label: {
                            HStack(spacing: 14) {
                                _XGb1029Lm(_xmg2303: card._xlg2033._xlm2050)
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(card._xlg2033._xlg2043).font(_XGl1005Bm._xlg2023(16)).foregroundStyle(_XMb1004Lg._xmg2018).lineLimit(1)
                                    HStack(spacing: 6) {
                                        Label(card._xmb2034._xbm2026, systemImage: card._xmb2034._xlb2027)
                                            .font(_XGl1005Bm._xgl2025(11)).foregroundStyle(card._xmb2034 == ._xgl2029 ? _XMb1004Lg._xbm2016 : _XMb1004Lg._xlb2017)
                                        if card._xbm2036 > 0 { Text("\(card._xbm2036)★").font(_XGl1005Bm._xgl2025(11)).foregroundStyle(_XMb1004Lg._xgl2015) }
                                    }
                                }
                                Spacer(minLength: 4)
                                if card._xgl2035 { Image(systemName: "star.fill").foregroundStyle(_XMb1004Lg._xlb2017) }
                            }
                            .padding(14)
                            .background(RoundedRectangle(cornerRadius: _XBm1006Gl._xbm2026).fill(_XMb1004Lg._xlg2013))
                        }.buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, 20).padding(.top, 4).padding(.bottom, 24)
            }
        }
    }
}

struct _XBm1026Gl: View {
    @EnvironmentObject private var shelf: _XGl1035Bm
    @State private var _xmb2114: _XBl1012Mg?
    var body: some View {
        let rows = shelf._xlb2147
        Group {
            if rows.isEmpty {
                VStack { Spacer(); _XGm1031Bl(_xmg2305: "star", _xbl2306: "No favourites yet", _xmg2307: "Star a cocktail in its recipe to keep it here."); Spacer() }
            } else {
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(rows) { card in
                            Button { _xmb2114 = card._xlg2033 } label: { _XLm1030Gb(_xmg2301: card._xlg2033, _xbl2302: card._xmb2034) }.buttonStyle(.plain)
                        }
                    }
                    .padding(.horizontal, 20).padding(.top, 8).padding(.bottom, 24)
                }
            }
        }
        .sheet(item: $_xmb2114) { p in
            _XMg1028Lb(_xbl2300: p).presentationDetents([.large]).presentationDragIndicator(.visible)
        }
    }
}
