//
//  View+Extension.swift
//  View+Extension
//
//  Created by Lokeswari Satyanarayana on 29/08/21.
//

import SwiftUI

extension View {
    func fillScreen(alignment: Alignment = .center) -> some View {
        frame(minWidth: 0,
              maxWidth: .infinity,
              minHeight: 0,
              maxHeight: .infinity,
              alignment: alignment)
    }
    
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}
