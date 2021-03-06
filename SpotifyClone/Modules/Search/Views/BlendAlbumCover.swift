//
//  BlendAlbumCoverMode.swift
//  BlendAlbumCoverMode
//
//  Created by Lokeswari Satyanarayana on 20/09/21.
//

import SwiftUI

enum BlendAlbumCoverMode: String {
    case red
    case blue
    case brown
}

struct BlendAlbumCover: View {
    
    let mode: BlendAlbumCoverMode
    
    var body: some View {
        ZStack {
            Color("blend-" + "\(mode.rawValue)" + "-background")
            VStack(spacing: 0) {
                BlendOverlappingCircleView(mode: mode, size: 120)
                HStack {
                    VStack(alignment: .leading, spacing: 2) {
                        Text("Blend").font(.body).fontWeight(.semibold).foregroundColor(.white)
                        Color("blend-" + "\(mode.rawValue)" + "-primary").frame(width: 60, height: 8, alignment: .leading)
                    }
                    .padding(.horizontal, Spacing.small)
                    Spacer()
                }
                .frame(height: 20, alignment: .leading)
            }
        }
        .frame(width: 150,
               height: 150,
               alignment: .center)
    }
}

struct BlendAlbumCover_Previews: PreviewProvider {
    static var previews: some View {
        BlendAlbumCover(mode: .red)
    }
}
