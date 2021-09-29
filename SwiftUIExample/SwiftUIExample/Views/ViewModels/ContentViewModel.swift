//
//  ContentViewModel.swift
//  ContentViewModel
//
//  Created by Eduardo Andres Rodriguez Parejo on 9/20/21.
//

import Foundation
import Combine

final class ContentViewModel: ObservableObject {
    @Published var launchCompleted: Bool = false
    
    func didAppear() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            self?.launchCompleted = true
        }
    }
}
