//
//  Label.swift
//  Label
//
//  Created by Eduardo Andres Rodriguez Parejo on 9/15/21.
//

import Foundation
import SwiftUI

struct LabelViewModel {
    let text: String
    let textColor: DisneyColor
    let font: DisneyFont
    let size: CGFloat
    let alignment: SwiftUI.TextAlignment = .center
}

struct Label: View {
    let viewModel: LabelViewModel
    
    var body: some View {
        Text(viewModel.text)
            .foregroundColor(viewModel.textColor.value)
            .font(Font.custom(viewModel.font.fontName, size: viewModel.size))
            .multilineTextAlignment(viewModel.alignment)
    }
}
