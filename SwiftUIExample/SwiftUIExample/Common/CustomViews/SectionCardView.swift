//
//  SectionCardView.swift
//  SectionCardView
//
//  Created by Eduardo Andres Rodriguez Parejo on 9/14/21.
//

import SwiftUI

struct SectionCardViewModel: Identifiable {
    var id: UUID = .init()
    let image: DisneyImage
    let callback: (() -> Void)
}

struct SectionCardView: View {
    let viewModel: SectionCardViewModel
    
    var body: some View {
        Button(action: viewModel.callback) {
            ZStack {
                Image(viewModel: ImageViewModel(image: viewModel.image))
                    .resizable()
                    .cornerRadius(10)
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 80, alignment: .center)
            }
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.white, lineWidth: 4)
            )
            .shadow(color: DisneyColor.topGradient.value, radius: 10, x: 0, y: 5)
            .padding(.all, 5)
        }
    }
}

struct SectionCardView_Previews: PreviewProvider {
    static var previews: some View {
        SectionCardView(viewModel: SectionCardViewModel(image: .starwarsLogo, callback: {}))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
