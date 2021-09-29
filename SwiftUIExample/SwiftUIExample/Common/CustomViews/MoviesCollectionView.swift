//
//  MoviesCollectionView.swift
//  MoviesCollectionView
//
//  Created by Eduardo Andres Rodriguez Parejo on 9/21/21.
//

import SwiftUI

struct MoviesCollectionViewModel {
    let title: String
    let displayableShow: [Show]
}

struct MoviesCollectionView: View {
    let viewModel: MoviesCollectionViewModel
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                Label(viewModel: LabelViewModel(text: viewModel.title, textColor: .white, font: .bold, size: 20))
                    .padding(.leading, 20)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(viewModel.displayableShow, id: \.id) { show in
                            MovieCardView(viewModel: MovieCardViewModel(image: .remote(URL(string: show.picture)), text: show.originalTitle ?? ""))
                                .frame(width: 150, alignment: .center)
                        }
                    }
                    .padding(.horizontal, 20)
                }
            }
        }
    }
}

struct MoviesCollectionView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            DisneyColor.bottomGradient.value
                .edgesIgnoringSafeArea(.all)
            MoviesCollectionView(viewModel: MoviesCollectionViewModel(title: "Marvel", displayableShow: []))
        }
    }
}

var mockMoviewCards: [MovieCardViewModel] = [
    MovieCardViewModel(image: .remote(URL(string: "https://image.tmdb.org/t/p/w500/xmbU4JTUm8rsdtn7Y3Fcm30GpeT.jpg")), text: "What if...?"),
    MovieCardViewModel(image: .remote(URL(string: "https://image.tmdb.org/t/p/w500/xmbU4JTUm8rsdtn7Y3Fcm30GpeT.jpg")), text: "What if...?"),
    MovieCardViewModel(image: .remote(URL(string: "https://image.tmdb.org/t/p/w500/xmbU4JTUm8rsdtn7Y3Fcm30GpeT.jpg")), text: "What if...?"),
    MovieCardViewModel(image: .remote(URL(string: "https://image.tmdb.org/t/p/w500/xmbU4JTUm8rsdtn7Y3Fcm30GpeT.jpg")), text: "What if...?"),
]
