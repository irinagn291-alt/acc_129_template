import Foundation

struct _XGm1011Bl: Codable, Hashable, Identifiable {
    let _xmg4038: String
    let _xgb4039: String?
    var id: String { _xmg4038 + (_xgb4039 ?? "") }
    var _xlm2041: String {
        [_xgb4039, _xmg4038].compactMap { $0?.trimmingCharacters(in: .whitespaces) }.filter { !$0.isEmpty }.joined(separator: " ")
    }

    enum CodingKeys: String, CodingKey {
        case _xmg4038 = "name"
        case _xgb4039 = "measure"
    }
}

struct _XBl1012Mg: Identifiable, Codable, Hashable {
    let _xbl2042: String
    let _xlg2043: String
    let _xmb2044: String?
    let _xgl2045: String?
    let _xbm2046: String?
    let _xlb2047: String?
    let _xmg2048: String?
    let _xgb2049: [_XGm1011Bl]

    var id: String { _xbl2042 }
    var _xlm2050: URL? { _xmb2044.flatMap(URL.init(string:)) }

    var _xgm2051: String {
        [_xbm2046, _xgl2045, _xlb2047].compactMap { $0 }.joined(separator: " · ")
    }

    enum CodingKeys: String, CodingKey {
        case _xbl2042 = "ref"
        case _xlg2043 = "name"
        case _xmb2044 = "thumb"
        case _xgl2045 = "category"
        case _xbm2046 = "strength"
        case _xlb2047 = "glass"
        case _xmg2048 = "method"
        case _xgb2049 = "jiggers"
    }
}
