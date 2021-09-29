//
//  MovieCardView.swift
//  MovieCardView
//
//  Created by Eduardo Andres Rodriguez Parejo on 9/14/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieCardViewModel: Identifiable {
    let id: UUID = .init()
    let image: DisneyImage
    let text: String
}

struct MovieCardView: View {
    let viewModel: MovieCardViewModel
    
    var body: some View {
        ZStack {
            VStack(spacing: 5) {
                WebImage(viewModel: ImageViewModel(image: viewModel.image))
                    .resizable()
                    .indicator(.activity) // Activity Indicator
                    .transition(.fade(duration: 0.5)) // Fade Transition with duration
                    .cornerRadius(10)
                    .aspectRatio(contentMode: .fit)
                    .frame(alignment: .center)
//                Label(viewModel: LabelViewModel(text: viewModel.text, textColor: .white, font: .regular, size: 17))
//                    .frame(height: 20, alignment: .center)
//                    .truncationMode(.head)
            }
        }
    }
}

struct MovieCardView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            DisneyColor.bottomGradient.value
            MovieCardView(viewModel: MovieCardViewModel(image: .remote(URL(string: "https://image.tmdb.org/t/p/w500/xmbU4JTUm8rsdtn7Y3Fcm30GpeT.jpg")), text: "What if...?"))
        }
        .frame(width: 300, height: 300, alignment: .center)
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
