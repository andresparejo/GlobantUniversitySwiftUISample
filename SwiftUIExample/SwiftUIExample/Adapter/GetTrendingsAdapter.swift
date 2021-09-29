//
//  GetTrendingsAdapter.swift
//  SwiftUIExample
//
//  Created by Eduardo Andres Rodriguez Parejo on 9/28/21.
//

import Foundation
import XCTest

typealias GetTrendingsCallback = ((ShowResponse) -> Void)

protocol GetTrendingsAdapter {
    func execute(callback: @escaping GetTrendingsCallback)
}

final class GetTrendingsAdapterImpl {
    struct Dependencies {
        let service: ServiceRequest = ServiceRequestImpl()
        let plist: PlistService = PlistServiceImpl()
    }
    
    private let dependencies: Dependencies
    
    init(dependencies: Dependencies = .init()) {
        self.dependencies = dependencies
    }
}

extension GetTrendingsAdapterImpl: GetTrendingsAdapter {
    func execute(callback: @escaping GetTrendingsCallback) {
        guard
            let urls: URLPListModel = dependencies.plist.getDataFromPList(fileName: .url),
            let paths: PathPListModel = dependencies.plist.getDataFromPList(fileName: .paths)
        else {
            return
        }
        
        dependencies.service.request(service: ServicePackage(url: urls.general, path: paths.trending)) { (result: Swift.Result<ShowResponse, Error>)  in
            switch result {
            case .success(let response):
                let trendings: ShowResponse = response
                callback(trendings)
            case .failure:
                break
            }
        }
    }
}
