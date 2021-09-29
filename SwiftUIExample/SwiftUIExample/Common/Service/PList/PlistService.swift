//
//  ServiceRequest.swift
//  capsl
//
//

import Foundation

protocol PlistService {
    func getDataFromPList<PropertyDecoder: Decodable>(fileName: PlistFileName, ext: String) -> PropertyDecoder?
}

extension PlistService {
    func getDataFromPList<PropertyDecoder: Decodable>(fileName: PlistFileName) -> PropertyDecoder? {
        getDataFromPList(fileName: fileName, ext: String.plist)
    }
}

final class PlistServiceImpl {
    struct Dependencies {
        let decoder = PropertyListDecoder()
    }
    
    var dependencies: Dependencies
    
    init(dependencies: Dependencies = Dependencies()) {
        self.dependencies = dependencies
    }
}

extension PlistServiceImpl: PlistService {
    func getDataFromPList<PropertyDecoder>(fileName: PlistFileName, ext: String) -> PropertyDecoder? where PropertyDecoder : Decodable {
        guard
            let path = Bundle.main.path(forResource: fileName.rawValue, ofType: ext),
            let xml = FileManager.default.contents(atPath: path),
            let preferences = try? PropertyListDecoder().decode(PropertyDecoder.self, from: xml)
        else {
            return nil
        }
        
        return preferences
    }
}

extension String {
    static var plist: String {
        return "plist"
    }
}
