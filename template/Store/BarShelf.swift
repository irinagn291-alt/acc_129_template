import Foundation
import Combine

@MainActor
final class _XGl1035Bm: ObservableObject {
    @Published private(set) var _xbl2142: [_XLm1010Gb] = []

    private let _xlg2143 = "shaker.bar.v1"
    private let _xmb2144: UserDefaults
    init(store: UserDefaults = .standard) { self._xmb2144 = store; _xbl2142 = _xbl2152() }

    func _xgl2145(ref: String) -> _XGb1009Lm? { _xbl2142.first { $0._xlg2033._xbl2042 == ref }?._xmb2034 }
    func _xbm2146(_ intent: _XGb1009Lm) -> [_XLm1010Gb] { _xbl2142.filter { $0._xmb2034 == intent } }
    var _xlb2147: [_XLm1010Gb] { _xbl2142.filter { $0._xgl2035 } }

    @discardableResult
    func _xmg2148(_ pour: _XBl1012Mg, as intent: _XGb1009Lm) -> _XLm1010Gb {
        if let i = _xbl2142.firstIndex(where: { $0._xlg2033._xbl2042 == pour._xbl2042 }) {
            _xbl2142[i]._xmb2034 = intent; _xgm2151(); return _xbl2142[i]
        }
        let card = _XLm1010Gb(_xlg2033: pour, _xmb2034: intent)
        _xbl2142.insert(card, at: 0); _xgm2151(); return card
    }
    func _xgb2149(ref: String) { _xbl2142.removeAll { $0._xlg2033._xbl2042 == ref }; _xgm2151() }
    func _xlm2150(ref: String, _ change: (inout _XLm1010Gb) -> Void) {
        guard let i = _xbl2142.firstIndex(where: { $0._xlg2033._xbl2042 == ref }) else { return }
        change(&_xbl2142[i]); _xgm2151()
    }

    private func _xgm2151() { if let b = try? JSONEncoder().encode(_xbl2142) { _xmb2144.set(b, forKey: _xlg2143) } }
    private func _xbl2152() -> [_XLm1010Gb] {
        guard let b = _xmb2144.data(forKey: _xlg2143), let d = try? JSONDecoder().decode([_XLm1010Gb].self, from: b) else { return [] }
        return d
    }
}
