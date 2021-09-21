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
    @State var activeTab: TabItems = .home
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                if (isPlayerExpanded == false) {
                    switch (activeTab) {
                    case .home :
                        HomeScreen()
                    case .search:
                        SearchScreen()
                    case .library:
                        LibraryScreen()
                    }
                }
                Player(isExpanded: $isPlayerExpanded)
                TabBar(tabItems: tabItems,
                       size: proxy.size,
                       activeTab: $activeTab)
                    .frame(height: isPlayerExpanded ? 0 : TabLayoutValues.height)
                    .opacity(isPlayerExpanded ? 0 : 1)
            }
            .background(isPlayerExpanded ?
                        LinearGradient(colors:[Color("Gray80"),.black],
                                       startPoint: .top,
                                       endPoint: .bottom) :
                            LinearGradient(colors:[.black, .black],
                                           startPoint: .top,
                                           endPoint: .bottom))
            .edgesIgnoringSafeArea(isPlayerExpanded ? .all : [])
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
