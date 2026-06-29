import Foundation

enum _XGb1009Lm: String, Codable, CaseIterable, Identifiable {
    case _xgl2029 = "shaken"
    case _xlm2030 = "toTry"

    var id: String { rawValue }
    var _xbm2026: String { self == ._xgl2029 ? "Shaken" : "To try" }
    var _xlb2027: String { self == ._xgl2029 ? "checkmark.circle.fill" : "hourglass" }
}

struct _XLm1010Gb: Identifiable, Codable, Hashable {
    let id: UUID
    let _xlg2033: _XBl1012Mg
    var _xmb2034: _XGb1009Lm
    var _xgl2035: Bool
    var _xbm2036: Int
    var _xlb2037: String
    let _xmg2038: Date

    enum CodingKeys: String, CodingKey {
        case id
        case _xlg2033 = "pour"
        case _xmb2034 = "intent"
        case _xgl2035 = "favorite"
        case _xbm2036 = "stars"
        case _xlb2037 = "tweak"
        case _xmg2038 = "pinnedAt"
    }

    init(_xlg2033: _XBl1012Mg, _xmb2034: _XGb1009Lm = ._xlm2030) {
        self.id = UUID()
        self._xlg2033 = _xlg2033
        self._xmb2034 = _xmb2034
        self._xgl2035 = false
        self._xbm2036 = 0
        self._xlb2037 = ""
        self._xmg2038 = Date()
    }
}
