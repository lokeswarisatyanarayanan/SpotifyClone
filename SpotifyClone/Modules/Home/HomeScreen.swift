//
//  HomeScreen.swift
//  HomeScreen
//
//  Created by Lokeswari Satyanarayana on 12/09/21.
//

import SwiftUI

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        let controller = UIViewController()
        DispatchQueue.main.async {
            if let navigationController = controller.navigationController {
                self.configure(navigationController)
            } else {
            }
        }
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController,
                                context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
    }
}

struct AlbumCover: View {
    
    let imageNames = ["sinatra1", "sinatra2", "cg1", "cg2", "elvis1", "elvis2", "gd1", "gd2", "aesthetic1", "aesthetic2", "aesthetic3", "aesthetic4", "aesthetic5"]
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(imageNames.randomElement() ?? "")
                .resizable()
                .frame(width: 100,
                       height: 100)
            Text("Album title")
                .font(.body)
                .fontWeight(.semibold)
            Text("Here's a short description of the album or the name of th artist")
                .font(.caption)
                .fontWeight(.light)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
        }
        .frame(width: 100,
               height: 150)
    }
}

struct HomeScreen: View {
    
    private let recentGridItems = [GridItem](repeating: GridItem(.fixed(HomeLayoutConstants.RecentPlayLists.width),
                                                                 spacing: Spacing.medium), count: 2)
    
    private let hGridItem = [GridItem](repeating: GridItem(.fixed(100),
                                                           spacing: Spacing.medium), count: 5)
    
    var body: some View {
        GeometryReader { proxy in
            NavigationView {
                ScrollView(.vertical) {
                    ZStack {
                        LinearGradient(colors:[Color("Gray80"),.black],
                                       startPoint: .top,
                                       endPoint: .bottom)
                        VStack {
                            Color.clear.frame(height: proxy.safeAreaInsets.top)
                            header
                            recentsSection
                            sections
                        }
                        .padding(Spacing.medium)
                        .foregroundColor(.white)
                    }
                }
                .background(NavigationConfigurator { navigationConfigurator in
                    navigationConfigurator.hidesBarsOnSwipe = true     // << here !!
                })
                .edgesIgnoringSafeArea(.all)
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        }
    }
    
    var header: some View {
        HStack {
            Text(timeGreeting()).font(.title2).fontWeight(.semibold)
            Spacer()
            HStack(spacing: Spacing.medium) {
                Image(systemName: "bell").font(.title3)
                Image(systemName: "clock.arrow.circlepath").font(.title3)
                Image(systemName: "gearshape").font(.title3)
            }
        }
    }
    
    var recentGridItem: some View {
        ZStack {
            Color(uiColor: .systemGray5)
                .frame(height: HomeLayoutConstants.RecentPlayLists.height)
                .cornerRadius(8)
            HStack {
                Image("sinatra2")
                    .resizable()
                    .frame(width: HomeLayoutConstants.RecentPlayLists.height,
                           height: HomeLayoutConstants.RecentPlayLists.height)
                Text("Frank Sinatras")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
                MusicPlayingIndicator()
            }
        }
    }
    
    var recentsSection: some View {
        LazyVGrid(columns: recentGridItems, alignment: .leading, spacing: Spacing.medium) {
            recentGridItem
            recentGridItem
            recentGridItem
            recentGridItem
            recentGridItem
            recentGridItem
        }
        .padding(.top, Spacing.medium)
    }
    
    var sections: some View {
        LazyVStack(alignment: .leading, spacing: 20) {
            Section(header: Text("Shows you might like").font(.title3).fontWeight(.semibold)) {
                ScrollView(.horizontal) {
                    LazyHStack {
                        AlbumCover()
                        AlbumCover()
                        AlbumCover()
                        AlbumCover()
                        AlbumCover()
                        AlbumCover()
                        AlbumCover()
                        AlbumCover()
                        AlbumCover()
                        AlbumCover()
                    }
                }
            }
            Section(header: Text("Jump back in").font(.title3).fontWeight(.semibold)) {
                ScrollView(.horizontal) {
                    LazyHStack {
                        AlbumCover()
                        AlbumCover()
                        AlbumCover()
                        AlbumCover()
                        AlbumCover()
                        AlbumCover()
                        AlbumCover()
                        AlbumCover()
                        AlbumCover()
                        AlbumCover()
                    }
                }
            }
            Section(header: Text("Made for You").font(.title3).fontWeight(.semibold)) {
                ScrollView(.horizontal) {
                    LazyHStack {
                        AlbumCover()
                        AlbumCover()
                        AlbumCover()
                        AlbumCover()
                        AlbumCover()
                        AlbumCover()
                        AlbumCover()
                        AlbumCover()
                        AlbumCover()
                        AlbumCover()
                    }
                }
            }
        }
        .padding(.top, Spacing.medium)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
