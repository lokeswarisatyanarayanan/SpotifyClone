//
//  BlendOverlappingCircleView.swift
//  BlendOverlappingCircleView
//
//  Created by Lokeswari Satyanarayana on 21/09/21.
//

import SwiftUI

struct BlendOverlappingCircleView: View {
    
    let mode: BlendAlbumCoverMode
    let size: CGFloat
    
    var body: some View {
        GeometryReader { proxy in
            Group {
                Color("blend-" + "\(mode.rawValue)" + "-primary")
                    .clipShape(Circle())
                    .frame(width: size/2, height: size/2, alignment: .center)
                    .offset(x: -size/8, y: size/8)
                Color("blend-" + "\(mode.rawValue)" + "-secondary").opacity(0.6)
                    .clipShape(Circle())
                    .frame(width: size/2, height: size/2, alignment: .center)
                    .offset(x: size/8, y: -size/8)
            }
            .frame(width: size,
                   height: size,
                   alignment: .center)
        }
        .frame(width: size,
               height: size,
               alignment: .center)
    }
}

struct BlendOverlappingCircleView_Previews: PreviewProvider {
    static var previews: some View {
        BlendOverlappingCircleView(mode: .blue, size: 120)
    }
}
