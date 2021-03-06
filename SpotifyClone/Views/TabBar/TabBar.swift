//
//  TabBar.swift
//  TabBar
//
//  Created by Lokeswari Satyanarayana on 10/09/21.
//

import SwiftUI

struct TabBar: View {
    
    private let indicatorPadding: CGFloat = 15
    private let indicatorHeight: CGFloat = 2
    private var itemWidth: CGFloat {
        return size.width/CGFloat(tabItems.count)
    }
    
    let tabItems: [TabItem]
    let size: CGSize
    
    @State var xOffset: CGFloat = 0
    
    @Binding var activeTab: TabItems
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Color.green
                .frame(width: itemWidth - indicatorPadding * 2,
                       height: indicatorHeight)
                .padding(.horizontal, indicatorPadding)
                .offset(x: xOffset, y: 0)
            HStack(spacing: 0) {
                ForEach(0..<tabItems.count) { index in
                    TabBarItem(isActive: index == activeTab.rawValue, item: tabItems[index]) {
                        self.activeTab = TabItems(rawValue: index) ?? .home
                        withAnimation(.interactiveSpring()) {
                            self.xOffset = CGFloat(index) * itemWidth
                        }
                    }
                    .frame(width: itemWidth,
                           height: TabLayoutValues.height)
                }
            }
            .background(.black)
        }
    }
}
