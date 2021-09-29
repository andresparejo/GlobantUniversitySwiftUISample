//
//  Colors.swift
//  Colors
//
//  Created by Eduardo Andres Rodriguez Parejo on 9/14/21.
//

import Foundation
import UIKit
import struct SwiftUI.Color

enum DisneyColor {
    case white
    case startingLoadingColor
    case endingLoadingColor
    case topGradient
    case bottomGradient
}

extension DisneyColor {
    var value: Color {
        switch self {
        case .white:
            return Color.white.opacity(0.9)
        case .topGradient:
            return Color(red: 0, green: 16 / 255.0, blue: 57 / 255.0)
        case .bottomGradient:
            return Color(red: 0, green: 65 / 255.0, blue: 148 / 255.0)
        case .startingLoadingColor:
            return Color(red: 56 / 255.0, green: 251 / 255.0, blue: 236 / 255.0)
        case .endingLoadingColor:
            return Color(red: 0 / 251.0, green: 68 / 255.0, blue: 200 / 255.0)
        }
    }
}
