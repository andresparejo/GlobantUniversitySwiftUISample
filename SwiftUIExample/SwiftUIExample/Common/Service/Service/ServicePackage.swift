//
//  ServicePackage.swift
//  ServicePackage
//
//  Created by Eduardo Andres Rodriguez Parejo on 9/17/21.
//

import Foundation
import Alamofire

struct ServicePackage {
    var url: String
    var path: String?
    var params: [String: Any]?
    var type: HTTPMethod
    
    init(url: String, path: String?, params: [String: Any]? = nil, type: HTTPMethod = .get) {
        self.url = url
        self.path = path
        self.params = params
        self.type = type
    }
    
    static let error = ServicePackage(url: "", path: nil)
}
