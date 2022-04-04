//
//  GameView.swift
//  GameStream
//
//  Created by Junior Eduardo Saravia Oria on 3/04/22.
//

import SwiftUI
import AVKit

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
                Video(url: url)
                    .frame(height: 300)
                
                ScrollView {
                    
                    InfoVideo(title: title, studio: studio, calification: calification, publicationYear: publicationYear, description: description, tags: tags)
                        .padding(.bottom)
                    
                }.frame(maxWidth: .infinity)
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

struct Video: View {
    
    var url: String
    
    var body: some View {
        VideoPlayer(player: AVPlayer(url: URL(string: url)!))
            .ignoresSafeArea()
    }
}

struct InfoVideo: View {
    
    var title: String
    var studio: String
    var calification: String
    var publicationYear: String
    var description: String
    var tags: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(title)")
                .foregroundColor(.white)
                .font(.largeTitle)
                .padding(.leading)
            
            HStack {
                Text("\(studio)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                    .padding(.leading)
                
                Text("\(calification)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                    .padding(.leading)
                
                Text("\(publicationYear)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                    .padding(.leading)
            }
            
            Text("\(description)")
                .foregroundColor(.white)
                .font(.subheadline)
                .padding(.top, 5)
                .padding(.leading)
            
            HStack {
                ForEach(tags, id: \.self) {
                    tag in
                    
                    Text("#\(tag)")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .padding(.top, 4)
                        .padding(.leading)
                }
            }
            
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}
