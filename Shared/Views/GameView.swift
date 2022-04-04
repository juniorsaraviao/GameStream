//
//  GameView.swift
//  GameStream
//
//  Created by Junior Eduardo Saravia Oria on 3/04/22.
//

import SwiftUI

struct GameView: View {
    
    var gameViewIsActive: Bool = false
    var url: String
    var title: String
    var studio: String
    var calification: String
    var publicationYear: String
    var description: String
    var tags: [String]
    var galleryImages: [String]
    
    var body: some View {
        ZStack {
            Color("marine").ignoresSafeArea()
            
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(url: "ejemplo",title:"Sonic The Hedgehog"
            ,studio:"Sega"
            ,calification:"E+"
            ,publicationYear:"1991"
            ,description:"Juego de Sega Genesis publicado en 1991 con más de 40 millones de copias vendidas actualmente"
            ,tags:["plataformas","mascota"], galleryImages: [ "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg"])
    }
}
