//
//  OffsetPosition.swift
//  GameStream
//
//  Created by Junior Eduardo Saravia Oria on 10/04/22.
//

import SwiftUI

struct OffsetPosition: View {
    var body: some View {
        // GR
        GeometryReader(content: { geometry in
        
        VStack {
            
            Image("platzi")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: geometry.size.width/2, height: geometry.size.height/3)
            
//            Offsets()
//
//            Positions()
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        })
    }
}

struct Offsets: View {
    var body: some View {
        Image("platzi")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 200)
            .offset(x: 18, y: -20)
        
        Text("Platzi")
            .foregroundColor(.blue)
            .bold()
    }
}

struct Positions: View {
    var body: some View {
        VStack {
            Image("platzi")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .position(x: 10, y: 10)
        }
    }
}

struct OffsetPosition_Previews: PreviewProvider {
    static var previews: some View {
        OffsetPosition()
    }
}
