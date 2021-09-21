//
//  LibraryScreen.swift
//  LibraryScreen
//
//  Created by Lokeswari Satyanarayana on 12/09/21.
//

import SwiftUI

struct LibraryScreen: View {
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(colors:[Color("Gray80"),.black],
                               startPoint: .top,
                               endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
            }
        }
        .navigationBarHidden(true)
    }
}

struct LibraryScreen_Previews: PreviewProvider {
    static var previews: some View {
        LibraryScreen()
    }
}
