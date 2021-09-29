//
//  PremierCardView.swift
//  PremierCardView
//
//  Created by Eduardo Andres Rodriguez Parejo on 9/14/21.
//

import SwiftUI

struct PremierCardViewModel: Identifiable {
    let id: UUID = .init()
    let image: ImageViewModel
    let title: String
}

struct PremierCardView: View {
    let viewModel: PremierCardViewModel
    
    var body: some View {
        ZStack {
            Image(viewModel: viewModel.image)
                .resizable()
                .cornerRadius(10)
                .aspectRatio(contentMode: .fit)
                .frame(height: 202, alignment: .center)
            VStack {
                Spacer()
                HStack {
                    Label(viewModel: LabelViewModel(text: viewModel.title, textColor: .white, font: .bold, size: 20))
                        .padding(.leading, 40)
                        .padding(.bottom, 20)
                    Spacer()
                }
            }
        }
    }
}

struct PremierCardView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            DisneyColor.bottomGradient.value
            PremierCardView(viewModel: PremierCardViewModel(image: .init(image: .premierSample), title: "The mandalorian"))
        }
        .frame(width: 400, height: 230, alignment: .center)
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
