//
//  RootView.swift
//  SpotifyClone
//
//  Created by Lokeswari Satyanarayana on 10/09/21.
//

import SwiftUI

struct RootView: View {
    
    let tabItems = [TabItem(assetName: "house", title: "Home"),
                    TabItem(assetName : "magnifyingglass", title: "Search"),
                    TabItem(assetName: "books.vertical", title: "Library")]
    @State var isPlayerExpanded: Bool = false
    
    var body: some View {
        GeometryReader { proxy in
            //Todo: Navigate to appropriate views
            VStack(spacing: Spacing.small) {
                Spacer()
                Player(isExpanded: $isPlayerExpanded)
                TabBar(tabItems: tabItems,
                       size: proxy.size)
                    .frame(height: isPlayerExpanded ? 0 : 60)
                    .opacity(isPlayerExpanded ? 0 : 1)
            }
            .background(LinearGradient(colors:[Color(uiColor: .darkGray),.black],
                                       startPoint: .top,
                                       endPoint: .bottom))
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
