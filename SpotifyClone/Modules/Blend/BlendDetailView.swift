//
//  BlendDetailView.swift
//  BlendDetailView
//
//  Created by Lokeswari Satyanarayana on 20/09/21.
//

import SwiftUI

struct BlendDetailView: View {
  var body: some View {
    ScrollView {
      GeometryReader { geometry in
        ZStack {
          if geometry.frame(in: .global).minY <= 0 {
            ZStack {
              Color("blend-blue-background")
              BlendOverlappingCircleView(mode: .blue, size: 240)
              VStack(alignment: .leading) {
                Spacer()
                Text("Newt Scamander + \nLuna")
                  .font(.title)
                  .fontWeight(.bold)
                  .foregroundColor(.white)
              }
              .fillScreen(alignment: .leading)
              .padding(30)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .offset(y: geometry.frame(in: .global).minY/9)
            .clipped()
          } else {
            ZStack {
              Color("blend-blue-background")
              BlendOverlappingCircleView(mode: .blue, size: 240)
                .scaleEffect(geometry.frame(in: .global).minY/geometry.frame(in: .global).height * 5 > 1 ?
                             geometry.frame(in: .global).minY/geometry.frame(in: .global).height * 5 : 1)
              VStack(alignment: .leading) {
                Spacer()
                Text("Newt Scamander + \nLuna")
                  .font(.title)
                  .fontWeight(.bold)
                  .foregroundColor(.white)
              }
              .fillScreen(alignment: .leading)
              .padding(30)
            }
            .frame(width: geometry.size.width, height: geometry.size.height + geometry.frame(in: .global).minY)
            .clipped()
            .offset(y: -geometry.frame(in: .global).minY)
          }
        }
      }
      .frame(height: 400)
            VStack(alignment: .leading) {
              
            }
            .frame(width: 350)
          }
    }
    .navigationBarBackButtonHidden(true)
    .edgesIgnoringSafeArea(.top)
  }
}

let articleContent =

"""
Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.

At vero eos et accusam et justo duo dolores et ea rebum.

Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua.

At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
"""
