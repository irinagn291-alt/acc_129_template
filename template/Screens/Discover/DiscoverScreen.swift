import SwiftUI

struct _XGm1021Bl: View {
    @EnvironmentObject private var shelf: _XGl1035Bm
    @StateObject private var _xgb2089 = _XBl1022Mg(mixology: _XGl1015Bm())
    @State private var _xlm2090: _XBl1012Mg?

    private let _xgm2091 = ["Margarita", "Negroni", "Mojito", "Old Fashioned", "Gin"]

    var body: some View {
        VStack(spacing: 14) {
            _xbl2092
            _xlg2093
            _xmb2094
        }
        .sheet(item: $_xlm2090) { p in
            _XMg1028Lb(_xbl2300: p).presentationDetents([.large]).presentationDragIndicator(.visible)
        }
    }

    private var _xbl2092: some View {
        Picker("", selection: $_xgb2089._xlg2103) {
            ForEach(_XBl1022Mg._XLg1023Gb.allCases, id: \.self) { Text($0.rawValue).tag($0) }
        }
        .pickerStyle(.segmented)
        .padding(.horizontal, 20)
    }

    private var _xlg2093: some View {
        HStack(spacing: 10) {
            Image(systemName: "magnifyingglass").foregroundStyle(_XMb1004Lg._xgb2019)
            TextField("", text: $_xgb2089._xbl2102,
                      prompt: Text(_xgb2089._xlg2103 == ._xgl2095 ? "Cocktail name…" : "An ingredient you have…").foregroundStyle(_XMb1004Lg._xgb2019))
                .font(_XGl1005Bm._xmb2024(16)).foregroundStyle(_XMb1004Lg._xmg2018)
                .submitLabel(.search).autocorrectionDisabled().onSubmit { _xgb2089._xlb2107() }
            if !_xgb2089._xbl2102.isEmpty { Button { _xgb2089._xmg2108() } label: { Image(systemName: "xmark.circle.fill").foregroundStyle(_XMb1004Lg._xgb2019) } }
        }
        .padding(.horizontal, 16).padding(.vertical, 14)
        .background(RoundedRectangle(cornerRadius: _XBm1006Gl._xlb2027).fill(_XMb1004Lg._xlg2013))
        .padding(.horizontal, 20)
    }

    @ViewBuilder
    private var _xmb2094: some View {
        switch _xgb2089._xmb2104 {
        case ._xlb2097:
            ScrollView {
                VStack(alignment: .leading, spacing: 10) {
                    Text("POPULAR ROUNDS").font(_XGl1005Bm._xgl2025(11)).tracking(2).foregroundStyle(_XMb1004Lg._xgb2019).padding(.top, 14)
                    let cols = [GridItem(.adaptive(minimum: 100), spacing: 10)]
                    LazyVGrid(columns: cols, alignment: .leading, spacing: 10) {
                        ForEach(_xgm2091, id: \.self) { idea in
                            Button { _xgb2089._xbl2102 = idea; _xgb2089._xlg2103 = idea == "Gin" ? ._xbm2096 : ._xgl2095; _xgb2089._xlb2107() } label: {
                                Text(idea).font(_XGl1005Bm._xmb2024(14)).foregroundStyle(_XMb1004Lg._xmg2018)
                                    .padding(.horizontal, 14).padding(.vertical, 12).frame(maxWidth: .infinity)
                                    .background(RoundedRectangle(cornerRadius: _XBm1006Gl._xlb2027).fill(_XMb1004Lg._xmb2014))
                            }
                        }
                    }
                }
                .padding(.horizontal, 20)
            }
        case ._xmg2098:
            Spacer(); ProgressView().tint(_XMb1004Lg._xgl2015).scaleEffect(1.2); Spacer()
        case ._xgb2099(let drinks):
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(drinks) { p in
                        Button { _xlm2090 = p } label: { _XLm1030Gb(_xmg2301: p, _xbl2302: shelf._xgl2145(ref: p._xbl2042)) }.buttonStyle(.plain)
                    }
                }
                .padding(.horizontal, 20).padding(.top, 4).padding(.bottom, 24)
            }
        case ._xlm2100:
            _XGm1031Bl(_xmg2305: "magnifyingglass", _xbl2306: "Nothing on the menu", _xmg2307: "No cocktails matched \"\(_xgb2089._xbl2102)\"."); Spacer()
        case ._xgm2101(let msg):
            _XGm1031Bl(_xmg2305: "wifi.slash", _xbl2306: "Bar's closed", _xmg2307: msg); Spacer()
        }
    }
}
