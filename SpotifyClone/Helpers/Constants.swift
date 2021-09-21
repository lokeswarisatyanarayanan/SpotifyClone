//
//  Constants.swift
//  Constants
//
//  Created by Lokeswari Satyanarayana on 12/09/21.
//

import Foundation
import UIKit

struct Spacing {
    static let small: CGFloat = 8
    static let medium: CGFloat = 16
    static let large: CGFloat = 24
    static let extraLarge: CGFloat = 36
    static let xxLarge: CGFloat = 48
}

struct TabLayoutValues {
    static let height: CGFloat = 60
}

struct PlayerLayoutValues {
    
    static let threshold: CGFloat = 120
    
    struct Expanded {
        static let innerCircleSize: CGFloat = 50
        static let height: CGFloat = UIScreen.main.bounds.height
        static let thumbnailImageWidth: CGFloat = UIScreen.main.bounds.width - Spacing.xxLarge
        static let thumbnailImageHeight: CGFloat = UIScreen.main.bounds.height/2
    }
    
    struct Collapsed {
        static let height: CGFloat = 50
        static let thumbnailImageWidth: CGFloat = 40
        static let thumbnailImageHeight: CGFloat = 40
    }
}
