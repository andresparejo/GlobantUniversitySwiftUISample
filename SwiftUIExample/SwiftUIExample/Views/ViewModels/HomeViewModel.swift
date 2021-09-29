//
//  HomeViewModel.swift
//  HomeViewModel
//
//  Created by Eduardo Andres Rodriguez Parejo on 9/21/21.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    struct Dependencies {
        let getTrendings: GetTrendingsAdapter = GetTrendingsAdapterImpl()
    }
    
    @Published var trendings: [Show] = []
    
    private let dependencies: Dependencies = .init()
    
    func didAppear() {
        dependencies.getTrendings.execute { [weak self] response in
            self?.trendings = response.results
        }
    }
}
