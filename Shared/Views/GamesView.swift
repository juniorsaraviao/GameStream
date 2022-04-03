//
//  GamesView.swift
//  GameStream
//
//  Created by Junior Eduardo Saravia Oria on 1/04/22.
//

import SwiftUI

struct GamesView: View {
    
    @ObservedObject var allVideoGames = ViewModel()
    
    var body: some View {
        Text("Games View")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear(
                
                perform: {
                    print("1st json element: \(allVideoGames.gamesInfo[0])")
                    print("1st videogame title: \(allVideoGames.gamesInfo[0].title)")
                }
                
            )
    }
}

struct GamesView_Previews: PreviewProvider {
    static var previews: some View {
        GamesView()
    }
}
