import SwiftUI

@MainActor
final class _XBl1022Mg: ObservableObject {
    enum _XLg1023Gb: String, CaseIterable { case _xgl2095 = "By name", _xbm2096 = "By ingredient" }
    enum _XMb1024Lg: Equatable {
        case _xlb2097, _xmg2098, _xgb2099([_XBl1012Mg]), _xlm2100, _xgm2101(String)
    }

    @Published var _xbl2102 = ""
    @Published var _xlg2103: _XLg1023Gb = ._xgl2095
    @Published private(set) var _xmb2104: _XMb1024Lg = ._xlb2097

    private let _xgl2105: _XMb1014Lg
    private var _xbm2106: Task<Void, Never>?
    init(mixology: _XMb1014Lg) { self._xgl2105 = mixology }

    func _xlb2107() {
        _xbm2106?.cancel()
        guard !_xbl2102.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        let q = _xbl2102, m = _xlg2103
        _xbm2106 = Task {
            _xmb2104 = ._xmg2098
            do {
                let drinks = m == ._xgl2095 ? try await _xgl2105._xmb2054(q) : try await _xgl2105._xgl2055(q)
                if Task.isCancelled { return }
                _xmb2104 = drinks.isEmpty ? ._xlm2100 : ._xgb2099(drinks)
            } catch is CancellationError {
            } catch _XLg1013Gb._xbl2052 {
                if !Task.isCancelled { _xmb2104 = ._xlm2100 }
            } catch {
                if !Task.isCancelled { _xmb2104 = ._xgm2101(error.localizedDescription) }
            }
        }
    }

    func _xmg2108() { _xbm2106?.cancel(); _xbl2102 = ""; _xmb2104 = ._xlb2097 }
}
