import SwiftUI

enum _XGm1001Bl {
    case _xgm2001
    case _xbl2002
    case _xlg2003
}

@MainActor
final class _XBl1002Mg: ObservableObject {
    @Published var _xmb2004: _XGm1001Bl = ._xgm2001
    @AppStorage("shaker.tourDone") private var _xgl2005 = false

    func _xbm2006() { _xmg2008(_xgl2005 ? ._xlg2003 : ._xbl2002) }
    func _xlb2007() { _xgl2005 = true; _xmg2008(._xlg2003) }
    private func _xmg2008(_ s: _XGm1001Bl) { withAnimation(.easeInOut(duration: 0.5)) { _xmb2004 = s } }
}

@MainActor
final class _XLg1003Gb: ObservableObject {
    let _xgb2009: _XMb1014Lg
    let _xlm2010: _XGl1035Bm
    let _xgm2011: _XBl1002Mg
    init(_xgb2009: _XMb1014Lg = _XGl1015Bm()) {
        self._xgb2009 = _xgb2009
        self._xlm2010 = _XGl1035Bm()
        self._xgm2011 = _XBl1002Mg()
    }
}
