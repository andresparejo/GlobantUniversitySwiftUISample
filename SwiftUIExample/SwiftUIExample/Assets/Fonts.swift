//
//  Fonts.swift
//  Fonts
//
//  Created by Eduardo Andres Rodriguez Parejo on 9/15/21.
//

import Foundation

enum DisneyFont {
    case bold
    case regular
}

extension DisneyFont {
    var fontName: String {
        switch self {
        case .bold: return "AvenirLTStd-Black"
        case .regular: return "AvenirLTStd-Book"
        }
    }
}
