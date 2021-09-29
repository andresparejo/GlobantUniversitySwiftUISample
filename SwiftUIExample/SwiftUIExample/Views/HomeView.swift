//
//  HomeView.swift
//  HomeView
//
//  Created by Eduardo Andres Rodriguez Parejo on 9/20/21.
//

import SwiftUI
import Combine

struct HomeView: View {
    
    private var threeColumnGrid = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ] //[GridItem(.adaptive(minimum: 100, maximum: 200))]
    
    @StateObject var viewModel: HomeViewModel = .init()
    
    var body: some View {
        ZStack {
            BackgroundView()
                .edgesIgnoringSafeArea(.all)
            if viewModel.trendings.isEmpty {
                ActivityIndicatorView()
                    .onAppear {
                        viewModel.didAppear()
                    }
            } else {
                VStack(spacing: 10) {
                    ScrollView(.vertical) {
                        PremierCollecionView()
                        LazyVGrid(columns: threeColumnGrid, alignment: .center) {
                            SectionCardView(viewModel: SectionCardViewModel(image: .disneyLogo, callback: {}))
                            SectionCardView(viewModel: SectionCardViewModel(image: .pixarLogo, callback: {}))
                            SectionCardView(viewModel: SectionCardViewModel(image: .marvelLogo, callback: {}))
                            SectionCardView(viewModel: SectionCardViewModel(image: .starwarsLogo, callback: {}))
                            SectionCardView(viewModel: SectionCardViewModel(image: .natgeoLogo, callback: {}))
                        }
                        .padding(.all, 20)
                        VStack(spacing: 30) {
                            MoviesCollectionView(viewModel: MoviesCollectionViewModel(title: "Trendings", displayableShow: viewModel.trendings.shuffled()))
                            MoviesCollectionView(viewModel: MoviesCollectionViewModel(title: "Movies", displayableShow: viewModel.trendings.shuffled()))
                            MoviesCollectionView(viewModel: MoviesCollectionViewModel(title: "TV", displayableShow: viewModel.trendings.shuffled()))
                        }
                    }
                }
            }
            
        }
        .navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice("iPhone 11")
            .previewLayout(.device)
        HomeView()
            .previewDevice("iPhone 8")
            .previewLayout(.device)
    }
}
