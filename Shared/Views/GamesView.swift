//
//  GamesView.swift
//  GameStream
//
//  Created by Junior Eduardo Saravia Oria on 1/04/22.
//

import SwiftUI

struct GamesView: View {
    var body: some View {
        Text("Games View")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear(
                
                perform: {
                    print("json element:")
                    print("1st videogame")
                }
                
            )
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
