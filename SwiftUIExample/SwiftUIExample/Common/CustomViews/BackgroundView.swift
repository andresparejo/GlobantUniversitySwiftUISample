//
//  BackgroundView.swift
//  BackgroundView
//
//  Created by Eduardo Andres Rodriguez Parejo on 9/15/21.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [DisneyColor.topGradient.value,
                                                   DisneyColor.bottomGradient.value]),
                       startPoint: .top,
                       endPoint: .bottom)
    }
}
