import Foundation

private func _sd(_ b: String) -> String {
    String(data: Data(base64Encoded: b) ?? Data(), encoding: .utf8) ?? ""
}

enum _XLg1013Gb: LocalizedError {
    case _xbl2052
    case _xlg2053
    var errorDescription: String? {
        switch self {
        case ._xbl2052: return "No cocktails matched."
        case ._xlg2053: return "Couldn't reach the bar."
        }
    }
}

protocol _XMb1014Lg: Sendable {
    func _xmb2054(_ name: String) async throws -> [_XBl1012Mg]
    func _xgl2055(_ ingredient: String) async throws -> [_XBl1012Mg]
    func _xbm2056() async throws -> _XBl1012Mg
    func _xlb2057(_ ref: String) async throws -> _XBl1012Mg
}

final class _XGl1015Bm: _XMb1014Lg, Sendable {
    private let _xmg2058 = _sd("aHR0cHM6Ly93d3cudGhlY29ja3RhaWxkYi5jb20vYXBpL2pzb24vdjEvMQ==")
    private let _xgb2059: URLSession
    init(session: URLSession = .shared) { self._xgb2059 = session }

    func _xmb2054(_ name: String) async throws -> [_XBl1012Mg] {
        let q = name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let drinks = try await _xlm2060(at: "\(_xmg2058)/search.php?s=\(q)")
        if drinks.isEmpty { throw _XLg1013Gb._xbl2052 }
        return drinks
    }

    func _xgl2055(_ ingredient: String) async throws -> [_XBl1012Mg] {
        let q = ingredient.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let sparse = try await _xlm2060(at: "\(_xmg2058)/filter.php?i=\(q)")
        if sparse.isEmpty { throw _XLg1013Gb._xbl2052 }
        return sparse
    }

    func _xbm2056() async throws -> _XBl1012Mg {
        guard let p = try await _xlm2060(at: "\(_xmg2058)/random.php").first else { throw _XLg1013Gb._xbl2052 }
        return p
    }

    func _xlb2057(_ ref: String) async throws -> _XBl1012Mg {
        guard let p = try await _xlm2060(at: "\(_xmg2058)/lookup.php?i=\(ref)").first else { throw _XLg1013Gb._xbl2052 }
        return p
    }

    private func _xlm2060(at urlString: String) async throws -> [_XBl1012Mg] {
        guard let url = URL(string: urlString) else { throw _XLg1013Gb._xlg2053 }
        guard
            let (data, resp) = try? await _xgb2059.data(from: url),
            let http = resp as? HTTPURLResponse, (200..<300).contains(http.statusCode)
        else { throw _XLg1013Gb._xlg2053 }
        let payload = try JSONDecoder().decode(_XBm1036Gl.self, from: data)
        return (payload._xgb2208 ?? []).map { $0._xgm2061() }
    }

    private struct _XBm1036Gl: Decodable {
        let _xgb2208: [_XLb1037Mg]?
        enum CodingKeys: String, CodingKey {
            case _xgb2208 = "drinks"
        }
    }

    private struct _XLb1037Mg: Decodable {
        let _xgm2200: String
        let _xbl2201: String
        let _xlg2202: String?
        let _xmb2203: String?
        let _xgl2204: String?
        let _xbm2205: String?
        let _xlb2206: String?
        let _xmg2207: [String: String?]

        init(from decoder: Decoder) throws {
            let c = try decoder.container(keyedBy: _XMg1038Lb.self)
            _xgm2200 = try c.decode(String.self, forKey: _XMg1038Lb("idDrink"))
            _xbl2201 = (try? c.decode(String.self, forKey: _XMg1038Lb("strDrink"))) ?? "Cocktail"
            _xlg2202 = try? c.decode(String.self, forKey: _XMg1038Lb("strDrinkThumb"))
            _xmb2203 = try? c.decode(String.self, forKey: _XMg1038Lb("strCategory"))
            _xgl2204 = try? c.decode(String.self, forKey: _XMg1038Lb("strAlcoholic"))
            _xbm2205 = try? c.decode(String.self, forKey: _XMg1038Lb("strGlass"))
            _xlb2206 = try? c.decode(String.self, forKey: _XMg1038Lb("strInstructions"))
            var collected: [String: String?] = [:]
            for n in 1...15 {
                collected["i\(n)"] = try? c.decodeIfPresent(String.self, forKey: _XMg1038Lb("strIngredient\(n)"))
                collected["m\(n)"] = try? c.decodeIfPresent(String.self, forKey: _XMg1038Lb("strMeasure\(n)"))
            }
            _xmg2207 = collected
        }

        func _xgm2061() -> _XBl1012Mg {
            var jiggers: [_XGm1011Bl] = []
            for n in 1...15 {
                if let name = (_xmg2207["i\(n)"] ?? nil)?.trimmingCharacters(in: .whitespaces), !name.isEmpty {
                    let measure = (_xmg2207["m\(n)"] ?? nil)?.trimmingCharacters(in: .whitespaces)
                    jiggers.append(_XGm1011Bl(_xmg4038: name, _xgb4039: measure?.isEmpty == true ? nil : measure))
                }
            }
            return _XBl1012Mg(
                _xbl2042: _xgm2200, _xlg2043: _xbl2201, _xmb2044: _xlg2202,
                _xgl2045: _xmb2203, _xbm2046: _xgl2204, _xlb2047: _xbm2205,
                _xmg2048: _xlb2206, _xgb2049: jiggers
            )
        }

        struct _XMg1038Lb: CodingKey {
            var stringValue: String
            var intValue: Int? { nil }
            init(_ s: String) { stringValue = s }
            init?(stringValue: String) { self.stringValue = stringValue }
            init?(intValue: Int) { nil }
        }
    }
}
