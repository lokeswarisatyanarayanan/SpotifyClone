//
//  Player.swift
//  Player
//
//  Created by Lokeswari Satyanarayana on 12/09/21.
//

import SwiftUI

struct Player: View {
    
    private let song: Song = Song(title: "Fly me to the moon", artist: "Frank Sinatra", assetIdentifier: "sinatra1")
    
    @Binding var isExpanded: Bool
    @State var yOffset: CGFloat = 0
    @State var height: CGFloat = PlayerLayoutValues.Collapsed.height
    @State var thumbnailImageHeight: CGFloat = PlayerLayoutValues.Collapsed.thumbnailImageHeight
    @State var thumbnailImageWidth: CGFloat = PlayerLayoutValues.Collapsed.thumbnailImageWidth
    @State var isDragInProgress: Bool = false
    @State var sliderValue: CGFloat = 0
    @State var isSliderEditing: Bool = false
    
    var body: some View {
        ZStack {
            Color("Gray80")
                .cornerRadius(radius: Spacing.small,
                              corners: isExpanded ? [.topLeft, .topRight] : [.allCorners])
                .frame(maxHeight: height)
            HStack(spacing: Spacing.small) {
                VStack(alignment: .leading) {
                    thumbnailImage
                    if(isExpanded) {
                        expandedPlayerContent
                    }
                }
                .padding([.top, .horizontal],
                         isExpanded ? Spacing.medium : 0)
                if (isExpanded == false) {
                    collapsedPlayerContent
                }
            }
            .padding(Spacing.small)
        }
        .padding(.horizontal, isExpanded ? 0: Spacing.small)
        .offset(y: yOffset)
        .onTapGesture {
            withAnimation(.linear(duration: 0.2)) {
                isExpanded.toggle()
                updatePlayerLayout()
            }
        }
        .gesture(DragGesture()
                    .onChanged(onDragGestureChange(value:))
                    .onEnded(onDragGestureEnd(value:)))
    }
    
    var thumbnailImage: some View {
        Image(song.assetIdentifier)
            .resizable()
            .frame(width: thumbnailImageWidth,
                   height: thumbnailImageHeight,
                   alignment: .leading)
            .cornerRadius(Spacing.small)
            .padding(.top, isExpanded ? 50 : 0)
    }
    
    var collapsedPlayerContent: some View {
        Group {
            VStack(alignment: .leading) {
                Text(song.title)
                    .foregroundColor(.white)
                    .font(.body)
                Text(song.artist)
                    .foregroundColor(.white)
                    .font(.caption2)
            }
            Spacer()
            HStack {
                Image(systemName: "heart")
                    .foregroundColor(.white)
                    .padding(.trailing, Spacing.small)
                Image(systemName: "play.fill")
                    .foregroundColor(.white)
                    .padding(.trailing, Spacing.small)
            }
        }
        .opacity(isDragInProgress ? 0 : 1)
    }
    
    var expandedPlayerContent: some View {
        Group {
            Spacer()
            VStack (alignment: .leading, spacing: Spacing.small) {
                Text(song.title)
                    .font(.title2)
                    .fontWeight(.semibold)
                Text(song.artist)
                    .font(.body)
            }
            .foregroundColor(.white)
            Slider(value: $sliderValue) { isEditing in
                isSliderEditing = isEditing
            }
            .tint(.white)
            HStack {
                Image(systemName: "shuffle").font(.body)
                Spacer()
                Image(systemName: "backward.end.fill").font(.title3)
                Spacer()
                ZStack {
                    Color.white
                        .frame(width: PlayerLayoutValues.Expanded.innerCircleSize,
                               height: PlayerLayoutValues.Expanded.innerCircleSize,
                               alignment: .center)
                        .clipShape(Circle())
                    Image(systemName: "play.fill")
                        .font(.body)
                        .foregroundColor(.black)
                }
                Spacer()
                Image(systemName: "forward.end.fill").font(.title3)
                Spacer()
                Image(systemName: "repeat").font(.body)
            }
            .foregroundColor(.white)
            .padding(Spacing.small)
            Spacer()
        }
    }
    
    func onDragGestureChange(value: DragGesture.Value) {
        if (isSliderEditing == false) {
            isDragInProgress = true
            let translationHeight = abs(value.translation.height) + height
            if value.translation.height > 0 && isExpanded {
                yOffset = value.translation.height
            } else {
                yOffset = value.translation.height
                height = translationHeight
                thumbnailImageWidth = height/2
                thumbnailImageHeight = height/2
                if (height > PlayerLayoutValues.Expanded.height/2) {
                    isExpanded = true
                    updatePlayerLayout()
                }
            }
        }
    }
    
    func onDragGestureEnd(value: DragGesture.Value) {
        if (isSliderEditing == false) {
            isDragInProgress = false
            withAnimation(.interactiveSpring()) {
                if (value.translation.height > UIScreen.main.bounds.height/2 ) {
                    isExpanded = false
                    updatePlayerLayout()
                } else {
                    isExpanded = true
                    updatePlayerLayout()
                }
                yOffset = 0
            }
        }
    }
    
    func updatePlayerLayout() {
        if isExpanded {
            height = PlayerLayoutValues.Expanded.height
            thumbnailImageWidth = PlayerLayoutValues.Expanded.thumbnailImageWidth
            thumbnailImageHeight = PlayerLayoutValues.Expanded.thumbnailImageHeight
        } else {
            height = PlayerLayoutValues.Collapsed.height
            thumbnailImageWidth = PlayerLayoutValues.Collapsed.thumbnailImageWidth
            thumbnailImageHeight = PlayerLayoutValues.Collapsed.thumbnailImageHeight
        }
    }
}
