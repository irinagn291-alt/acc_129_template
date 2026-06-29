import SwiftUI

struct _XLb1027Mg: View {
    @EnvironmentObject private var lounge: _XBl1002Mg
    @State private var _xgl2115: CGFloat = 0
    @State private var _xbm2116 = false
    @State private var _xlb2117 = false

    var body: some View {
        ZStack {
            _XMb1004Lg._xbl2012.ignoresSafeArea()
            VStack(spacing: 28) {
                Spacer()
                _xmg2118
                VStack(spacing: 8) {
                    Text("Shaker")
                        .font(_XGl1005Bm._xbl2022(44))
                        .foregroundStyle(_XMb1004Lg._xgl2015)
                    Text("OPEN")
                        .font(_XGl1005Bm._xlg2023(16))
                        .tracking(6)
                        .foregroundStyle(_XMb1004Lg._xbm2016)
                        .opacity(_xbm2116 ? 1 : 0.25)
                }
                .opacity(_xlb2117 ? 1 : 0)
                .offset(y: _xlb2117 ? 0 : 14)
                Spacer()
            }
        }
        .onAppear(perform: _xgb2119)
    }

    private var _xmg2118: some View {
        ZStack(alignment: .bottom) {
            Image(systemName: "wineglass")
                .font(.system(size: 110, weight: .regular))
                .foregroundStyle(_XMb1004Lg._xmg2018.opacity(0.15))
            Image(systemName: "wineglass.fill")
                .font(.system(size: 110, weight: .regular))
                .foregroundStyle(_XMb1004Lg._xgl2015)
                .mask(
                    Rectangle().frame(height: 130 * _xgl2115).frame(maxHeight: 130, alignment: .bottom)
                )
        }
        .frame(height: 130)
        .overlay(alignment: .top) {
            Circle().fill(_XMb1004Lg._xlb2017).frame(width: 16, height: 16).offset(y: _xlb2117 ? -6 : -40).opacity(_xlb2117 ? 1 : 0)
        }
    }

    private func _xgb2119() {
        withAnimation(.easeInOut(duration: 1.4)) { _xgl2115 = 1 }
        withAnimation(.easeInOut(duration: 0.5).repeatForever(autoreverses: true)) { _xbm2116 = true }
        withAnimation(.spring(response: 0.6, dampingFraction: 0.6).delay(0.5)) { _xlb2117 = true }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.3) { self.lounge._xbm2006() }
    }
}
