import SwiftUI

struct _XMg1028Lb: View {
    let _xbl2300: _XBl1012Mg

    @EnvironmentObject private var kit: _XLg1003Gb
    @EnvironmentObject private var shelf: _XGl1035Bm
    @Environment(\.dismiss) private var dismiss
    @State private var _xlm2120: _XBl1012Mg?

    private var _xgm2121: _XBl1012Mg { _xlm2120 ?? _xbl2300 }
    private var _xbl2122: _XLm1010Gb? { shelf._xbl2142.first { $0._xlg2033._xbl2042 == _xbl2300._xbl2042 } }

    var body: some View {
        ZStack {
            _XMb1004Lg._xbl2012.ignoresSafeArea()
            ScrollView {
                VStack(spacing: 20) {
                    _XGb1029Lm(_xmg2303: _xgm2121._xlm2050, _xbl2304: 180)
                        .padding(.top, 8)
                    Text(_xgm2121._xlg2043).font(_XGl1005Bm._xbl2022(26)).multilineTextAlignment(.center).foregroundStyle(_XMb1004Lg._xmg2018)
                    if !_xgm2121._xgm2051.isEmpty {
                        Text(_xgm2121._xgm2051).font(_XGl1005Bm._xmb2024(14)).foregroundStyle(_XMb1004Lg._xgb2019)
                    }
                    _xlg2123
                    if let c = _xbl2122 { _xgl2125(c) }
                    _xbm2126
                    _xlb2127
                }
                .padding(20)
            }
        }
        .task { await _xmg2128() }
    }

    private var _xlg2123: some View {
        HStack(spacing: 10) {
            _xmb2124("checkmark.circle.fill", "Shaken", _xbl2122?._xmb2034 == ._xgl2029, _XMb1004Lg._xbm2016) { shelf._xmg2148(_xgm2121, as: ._xgl2029) }
            _xmb2124("hourglass", "To try", _xbl2122?._xmb2034 == ._xlm2030, _XMb1004Lg._xlb2017) { shelf._xmg2148(_xgm2121, as: ._xlm2030) }
            if _xbl2122 != nil {
                Button { shelf._xgb2149(ref: _xbl2300._xbl2042); dismiss() } label: {
                    Image(systemName: "trash").foregroundStyle(_XMb1004Lg._xgb2019)
                        .frame(width: 50, height: 50).background(Circle().fill(_XMb1004Lg._xmb2014))
                }
            }
        }
    }
    private func _xmb2124(_ icon: String, _ label: String, _ on: Bool, _ tint: Color, _ a: @escaping () -> Void) -> some View {
        Button(action: a) {
            Label(label, systemImage: icon).font(_XGl1005Bm._xlg2023(14)).foregroundStyle(on ? .white : _XMb1004Lg._xmg2018)
                .frame(maxWidth: .infinity).padding(.vertical, 14)
                .background(RoundedRectangle(cornerRadius: _XBm1006Gl._xlb2027).fill(on ? tint : _XMb1004Lg._xlg2013))
        }
    }

    private func _xgl2125(_ c: _XLm1010Gb) -> some View {
        VStack(spacing: 14) {
            HStack {
                Text("MY RATING").font(_XGl1005Bm._xgl2025(11)).tracking(2).foregroundStyle(_XMb1004Lg._xgb2019)
                Spacer()
                Button { shelf._xlm2150(ref: _xbl2300._xbl2042) { $0._xgl2035.toggle() } } label: {
                    Image(systemName: c._xgl2035 ? "star.fill" : "star").foregroundStyle(c._xgl2035 ? _XMb1004Lg._xlb2017 : _XMb1004Lg._xgb2019)
                }
            }
            HStack(spacing: 10) {
                ForEach(1...5, id: \.self) { n in
                    Button { shelf._xlm2150(ref: _xbl2300._xbl2042) { $0._xbm2036 = n == c._xbm2036 ? n - 1 : n } } label: {
                        Image(systemName: n <= c._xbm2036 ? "circle.fill" : "circle").font(.system(size: 22))
                            .foregroundStyle(n <= c._xbm2036 ? _XMb1004Lg._xgl2015 : _XMb1004Lg._xlm2020)
                    }
                }
                Spacer()
            }
            TextField("", text: Binding(get: { c._xlb2037 }, set: { t in shelf._xlm2150(ref: _xbl2300._xbl2042) { $0._xlb2037 = t } }),
                      prompt: Text("Your tweak — extra lime, less sweet…").foregroundStyle(_XMb1004Lg._xgb2019), axis: .vertical)
                .font(_XGl1005Bm._xmb2024(14)).foregroundStyle(_XMb1004Lg._xmg2018).lineLimit(2...5)
                .padding(12).background(RoundedRectangle(cornerRadius: 12).fill(_XMb1004Lg._xmb2014))
        }
        .padding(16)
        .background(RoundedRectangle(cornerRadius: _XBm1006Gl._xbm2026).fill(_XMb1004Lg._xlg2013))
    }

    private var _xbm2126: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("INGREDIENTS").font(_XGl1005Bm._xgl2025(11)).tracking(2).foregroundStyle(_XMb1004Lg._xgb2019)
            ForEach(_xgm2121._xgb2049) { j in
                HStack(spacing: 10) {
                    Circle().fill(_XMb1004Lg._xgl2015).frame(width: 6, height: 6)
                    Text(j._xlm2041).font(_XGl1005Bm._xmb2024(15)).foregroundStyle(_XMb1004Lg._xmg2018)
                    Spacer()
                }
            }
            if _xgm2121._xgb2049.isEmpty { Text("—").foregroundStyle(_XMb1004Lg._xgb2019) }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(16).background(RoundedRectangle(cornerRadius: _XBm1006Gl._xbm2026).fill(_XMb1004Lg._xlg2013))
    }

    @ViewBuilder
    private var _xlb2127: some View {
        if let m = _xgm2121._xmg2048, !m.isEmpty {
            VStack(alignment: .leading, spacing: 10) {
                Text("METHOD").font(_XGl1005Bm._xgl2025(11)).tracking(2).foregroundStyle(_XMb1004Lg._xgb2019)
                Text(m).font(_XGl1005Bm._xmb2024(15)).foregroundStyle(_XMb1004Lg._xmg2018).lineSpacing(4)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(16).background(RoundedRectangle(cornerRadius: _XBm1006Gl._xbm2026).fill(_XMb1004Lg._xlg2013))
        }
    }

    private func _xmg2128() async {
        guard _xbl2300._xgb2049.isEmpty || _xbl2300._xmg2048 == nil else { return }
        _xlm2120 = try? await kit._xgb2009._xlb2057(_xbl2300._xbl2042)
    }
}
