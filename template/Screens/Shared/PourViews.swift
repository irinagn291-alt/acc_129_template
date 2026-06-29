import SwiftUI

struct _XGb1029Lm: View {
    let _xmg2303: URL?
    var _xbl2304: CGFloat = 64
    var body: some View {
        AsyncImage(url: _xmg2303) { phase in
            if case .success(let img) = phase { img.resizable().scaledToFill().clipped() }
            else { ZStack { _XMb1004Lg._xmb2014; Image(systemName: "wineglass.fill").foregroundStyle(_XMb1004Lg._xlb2017) } }
        }
        .frame(width: _xbl2304, height: _xbl2304)
        .clipShape(RoundedRectangle(cornerRadius: _XBm1006Gl._xlb2027, style: .continuous))
    }
}

struct _XLm1030Gb: View {
    let _xmg2301: _XBl1012Mg
    var _xbl2302: _XGb1009Lm?
    var body: some View {
        HStack(spacing: 14) {
            _XGb1029Lm(_xmg2303: _xmg2301._xlm2050)
            VStack(alignment: .leading, spacing: 4) {
                Text(_xmg2301._xlg2043).font(_XGl1005Bm._xlg2023(17)).foregroundStyle(_XMb1004Lg._xmg2018).lineLimit(2)
                if !_xmg2301._xgm2051.isEmpty {
                    Text(_xmg2301._xgm2051).font(_XGl1005Bm._xmb2024(13)).foregroundStyle(_XMb1004Lg._xgb2019).lineLimit(1)
                }
            }
            Spacer(minLength: 4)
            if let intent = _xbl2302 {
                Image(systemName: intent._xlb2027)
                    .foregroundStyle(intent == ._xgl2029 ? _XMb1004Lg._xbm2016 : _XMb1004Lg._xlb2017)
            }
        }
        .padding(14)
        .background(RoundedRectangle(cornerRadius: _XBm1006Gl._xbm2026, style: .continuous).fill(_XMb1004Lg._xlg2013))
    }
}

struct _XGm1031Bl: View {
    let _xmg2305: String
    let _xbl2306: String
    let _xmg2307: String
    var body: some View {
        VStack(spacing: 12) {
            Image(systemName: _xmg2305).font(.system(size: 42)).foregroundStyle(_XMb1004Lg._xgb2019.opacity(0.7))
            Text(_xbl2306).font(_XGl1005Bm._xlg2023(18)).foregroundStyle(_XMb1004Lg._xmg2018)
            Text(_xmg2307).font(_XGl1005Bm._xmb2024(14)).foregroundStyle(_XMb1004Lg._xgb2019)
                .multilineTextAlignment(.center).padding(.horizontal, 40)
        }
        .frame(maxWidth: .infinity).padding(.vertical, 36)
    }
}
