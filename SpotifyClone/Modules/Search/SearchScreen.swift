//
//  SearchScreen.swift
//  SearchScreen
//
//  Created by Lokeswari Satyanarayana on 12/09/21.
//

import SwiftUI

struct SearchScreen: View {
    
    var body: some View {
        GeometryReader { proxy in
            NavigationView {
                ScrollView(.vertical) {
                    ZStack {
                        LinearGradient(colors:[Color("Gray80"),.black],
                                       startPoint: .top,
                                       endPoint: .bottom)
                            .edgesIgnoringSafeArea(.all)
                        VStack {
                            Color.clear.frame(height: proxy.safeAreaInsets.top)
                            header
                            blendHorizontalList
                        }
                        .padding(.horizontal, Spacing.medium)
                    }
                }
                .edgesIgnoringSafeArea(.all)
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        }
    }
    
    private func blendRow(mode: BlendAlbumCoverMode, title: String, description: String) -> some View {
        NavigationLink(destination: BlendDetailView()) {
            VStack {
                BlendAlbumCover(mode: mode)
                VStack {
                    Text(title).font(.caption).fontWeight(.semibold).foregroundColor(.white)
                    Text(description).font(.caption).fontWeight(.medium).foregroundColor(.gray)
                }
            }
        }
    }
    
    private var blendHorizontalList: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 20) {
                VStack(spacing: 8) {
                    ZStack {
                        LinearGradient(colors: [Color(uiColor: .systemGreen),
                                                Color(uiColor: .systemBlue)],
                                       startPoint: .bottomTrailing,
                                       endPoint: .topLeading)
                        Image(systemName: "plus").resizable().frame(width: 50, height: 50, alignment: .center)
                    }
                    .frame(width: 150,
                           height: 150,
                           alignment: .center)
                    VStack {
                        Text("Create blend").font(.caption).fontWeight(.semibold).foregroundColor(.white)
                    }
                }
                blendRow(mode: .brown, title: "Newt + Queenie", description: "2 FOLLOWERS")
                blendRow(mode: .red, title: "Newt + Luna lovegood", description: "2 FOLLOWERS")
                blendRow(mode: .blue, title: "Newt + Leta lestrange", description: "2 FOLLOWERS")
            }
        }
    }
    
    private var header: some View {
        HStack {
            Text("Search")
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            Spacer()
        }
    }
}

struct SearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreen()
    }
}
