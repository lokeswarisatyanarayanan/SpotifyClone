//
//  TabBarItem.swift
//  TabBarItem
//
//  Created by Lokeswari Satyanarayana on 12/09/21.
//

import SwiftUI

struct TabItem {
    let assetName: String
    let title: String
}

enum TabItems: Int, CaseIterable {
    case home
    case search
    case library
}

struct TabBarItem: View {
    let isActive: Bool
    let item: TabItem
    let onItemPress: () -> Void
    
    var body: some View {
        Button {
            onItemPress()
        } label: {
            VStack {
                Image(systemName: item.assetName)
                Text(item.title).font(.caption)
            }
            .foregroundColor(isActive ? .white : .gray)
        }
    }
}
