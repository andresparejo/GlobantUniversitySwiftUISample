//
//  ActivityIndicatorView.swift
//  ActivityIndicatorView
//
//  Created by Eduardo Andres Rodriguez Parejo on 9/20/21.
//

import SwiftUI

struct ActivityIndicatorView: View {
    @State private var isLoading = false
     
        var body: some View {
            Circle()
                .trim(from: 0, to: 0.7)
                .stroke(LinearGradient(
                    gradient: Gradient(colors: [DisneyColor.startingLoadingColor.value, DisneyColor.bottomGradient.value]),
                    startPoint: .leading,
                    endPoint: .trailing), style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .frame(width: 100, height: 100)
                .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                .animation(Animation.default.repeatForever(autoreverses: false).speed(1.5))
                .onAppear() {
                    self.isLoading = true
                }
        }
}

struct ActivityIndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            DisneyColor.bottomGradient.value
            ActivityIndicatorView()
        }
        .frame(width: 230, height: 230, alignment: .center)
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
