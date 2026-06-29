import SwiftUI

enum _XMb1004Lg {
    static let _xbl2012 = _xgm2021("FFF9F3")
    static let _xlg2013 = _xgm2021("FFFFFF")
    static let _xmb2014 = _xgm2021("FFF1E6")

    static let _xgl2015 = _xgm2021("FF5C70")
    static let _xbm2016 = _xgm2021("1FA39B")
    static let _xlb2017 = _xgm2021("FFC247")

    static let _xmg2018 = _xgm2021("2A2230")
    static let _xgb2019 = _xgm2021("8A8095")
    static let _xlm2020 = _xgm2021("EFE4DA")

    static func _xgm2021(_ s: String) -> Color {
        var c = s; if c.hasPrefix("#") { c.removeFirst() }
        var n: UInt64 = 0; Scanner(string: c).scanHexInt64(&n)
        return Color(.sRGB, red: Double((n >> 16) & 255)/255, green: Double((n >> 8) & 255)/255, blue: Double(n & 255)/255, opacity: 1)
    }
}

enum _XGl1005Bm {
    static func _xbl2022(_ s: CGFloat) -> Font { .system(size: s, weight: .black, design: .rounded) }
    static func _xlg2023(_ s: CGFloat) -> Font { .system(size: s, weight: .heavy, design: .rounded) }
    static func _xmb2024(_ s: CGFloat) -> Font { .system(size: s, weight: .medium, design: .rounded) }
    static func _xgl2025(_ s: CGFloat) -> Font { .system(size: s, weight: .semibold, design: .rounded) }
}

enum _XBm1006Gl {
    static let _xbm2026: CGFloat = 28
    static let _xlb2027: CGFloat = 20
}

struct _XLb1007Mg: ButtonStyle {
    var _xmg2028: Color = _XMb1004Lg._xgl2015
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(_XGl1005Bm._xlg2023(18))
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 17)
            .background(RoundedRectangle(cornerRadius: _XBm1006Gl._xlb2027, style: .continuous).fill(_xmg2028))
            .scaleEffect(configuration.isPressed ? 0.96 : 1)
            .animation(.spring(response: 0.25, dampingFraction: 0.6), value: configuration.isPressed)
    }
}
