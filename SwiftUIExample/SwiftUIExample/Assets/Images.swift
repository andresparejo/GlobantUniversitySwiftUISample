//
//  Images.swift
//  Images
//
//  Created by Eduardo Andres Rodriguez Parejo on 9/15/21.
//

import Foundation
import UIKit
import SwiftUI
import SDWebImageSwiftUI

enum DisneyImage {
    case logo
    case starwarsLogo
    case natgeoLogo
    case marvelLogo
    case pixarLogo
    case disneyLogo
    case marvelSample
    case premierSample
    case remote(URL?)
}

extension DisneyImage {
    var image: UIImage? {
        switch self {
        case .logo:
            return UIImage(named: "disney_logo")
        case .starwarsLogo:
            return UIImage(named: "starwars")
        case .natgeoLogo:
            return UIImage(named: "natgeo")
        case .marvelLogo:
            return UIImage(named: "marvel")
        case .pixarLogo:
            return UIImage(named: "pixar")
        case .disneyLogo:
            return UIImage(named: "disney")
        case .marvelSample:
            return UIImage(named: "WhatIf")
        case .premierSample:
            return UIImage(named: "mandalarian_sample")
        case .remote:
            return nil
        }
    }
}

struct ImageViewModel {
    let image: DisneyImage
}


extension SwiftUI.Image {
    init(viewModel: ImageViewModel) {
        self.init(uiImage: viewModel.image.image ?? UIImage())
    }
}


extension SDWebImageSwiftUI.WebImage {
    init(viewModel: ImageViewModel) {
        switch(viewModel.image) {
        case .remote(let url):
            self.init(url: url)
        default:
            self.init(url: nil)
        }
    }
}
