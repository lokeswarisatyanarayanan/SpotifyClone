//
//  MusicPlayingIndicator.swift
//  MusicPlayingIndicator
//
//  Created by Lokeswari Satyanarayana on 20/09/21.
//

import SwiftUI

struct MusicPlayingIndicatorConstants {
    struct BlockOne {
        static let expandedHeight: CGFloat = 10
        static let collapsedHeight: CGFloat = 4
    }
    struct BlockTwo {
        static let expandedHeight: CGFloat = 8
        static let collapsedHeight: CGFloat = 4
    }
    struct BlockThree {
        static let expandedHeight: CGFloat = 10
        static let collapsedHeight: CGFloat = 4
    }
}

struct MusicPlayingIndicator: View {
    
    @State var enableBlockOneAnimation: Bool = false
    @State var enableBlockTwoAnimation: Bool = false
    @State var enableBlockThreeAnimation: Bool = false
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 2) {
            Color.green.frame(width: 2,
                              height: enableBlockOneAnimation ?
                              MusicPlayingIndicatorConstants.BlockOne.collapsedHeight :
                                MusicPlayingIndicatorConstants.BlockOne.expandedHeight)
            Color.green.frame(width: 2,
                              height: enableBlockTwoAnimation ?
                              MusicPlayingIndicatorConstants.BlockTwo.collapsedHeight :
                                MusicPlayingIndicatorConstants.BlockTwo.expandedHeight)
            Color.green.frame(width: 2,
                              height: enableBlockThreeAnimation ?
                              MusicPlayingIndicatorConstants.BlockThree.collapsedHeight :
                                MusicPlayingIndicatorConstants.BlockThree.expandedHeight)
        }
        .padding(.trailing, Spacing.small)
        .onAppear(perform: {
            withAnimation(.linear.repeatForever(autoreverses: true)) {
                enableBlockOneAnimation.toggle()
                withAnimation(.linear.delay(0.05).repeatForever(autoreverses: true)) {
                    enableBlockTwoAnimation.toggle()
                }
                withAnimation(.linear.delay(0.1).repeatForever(autoreverses: true)) {
                    enableBlockThreeAnimation.toggle()
                }
            }
        })
    }
}
