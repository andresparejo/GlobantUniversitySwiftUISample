//
//  ContentView.swift
//  SwiftUIExample
//
//  Created by Eduardo Andres Rodriguez Parejo on 9/14/21.
//

import SwiftUI
import Combine

struct ContentView: View {
    @ObservedObject var viewModel: ContentViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(isActive: $viewModel.launchCompleted) {
                    HomeView()
                } label: {}
                
                BackgroundView()
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Image(viewModel: ImageViewModel(image: .logo))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 100, alignment: .center)
                        .padding()
                    Label(viewModel: .init(text: "Welcome to Disney+", textColor: .white, font: .bold, size: 20))
                }
                .onAppear {
                    viewModel.didAppear()
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView(viewModel: ContentViewModel())
                .previewDevice("iPhone 11")
                .previewLayout(.device)
            ContentView(viewModel: ContentViewModel())
                .previewDevice("iPhone 8")
                .previewLayout(.device)
        }
        
    }
}
