import SwiftUI

struct _XMg1008Lb: View {
    @EnvironmentObject private var lounge: _XBl1002Mg

    var body: some View {
        ZStack {
            _XMb1004Lg._xbl2012.ignoresSafeArea()
            switch lounge._xmb2004 {
            case ._xgm2001: _XLb1027Mg()
            case ._xbl2002: _XLg1033Gb()
            case ._xlg2003: _XLm1020Gb()
            }
        }
        .preferredColorScheme(.light)
        .tint(_XMb1004Lg._xgl2015)
    }
}
