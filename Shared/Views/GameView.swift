//
//  GameView.swift
//  GameStream
//
//  Created by Junior Eduardo Saravia Oria on 3/04/22.
//

import SwiftUI
import AVKit
import Kingfisher

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
                    
                    Gallery(galleryImages: galleryImages)
                    
                    Comments()
                    
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
        let player = AVPlayer(url: URL(string: url)!)
        VideoPlayer(player: player)
            .ignoresSafeArea()
            .onDisappear(perform: {
                player.pause()
            })
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

struct Gallery: View {
    
    var galleryImages: [String]
    
    let gridShape = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("GALERÍA")
                .foregroundColor(.white)
                .font(.title)
                .padding(.leading)
            
            ScrollView(.horizontal) {
                
                LazyHGrid(rows: gridShape, spacing: 8) {
                    ForEach(galleryImages, id: \.self){
                        img in
                        KFImage(URL(string: img))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                }
                
            }.frame(height: 180)
            
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct Comments: View {
    
    var body: some View{
        
        VStack(alignment: .leading){
            
            Text("COMENTARIOS").foregroundColor(.white).font(.title).padding(.leading)
            
            VStack {
                Spacer()
                HStack{
                    
                    Image("perfilEjemplo").resizable().aspectRatio(contentMode: .fit).frame(width: 80, height: 80, alignment: .leading).padding(.leading)
                    
                    VStack{
                        
                        Text("Enrique Ramos").foregroundColor(.white).font(.subheadline).fontWeight(.bold).frame(alignment: .leading).padding(.bottom)
                        
                        Text("Hace 7 días").foregroundColor(.white).font(.subheadline).frame(alignment: .leading).padding(.bottom)
                        
                        
                    }
                    
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                Text("He visto que como media tiene una gran calificación, y estoy completamente de acuerdo. Es el mejor juego que he jugado sin ninguna duda, combina una buena trama con una buenísima experiencia de juego libre gracias a su inmenso mapa y actividades.").foregroundColor(.white).font(.subheadline).frame(alignment: .leading)
                    .padding(.all, 5)
                Spacer()
                
            }.frame(maxWidth: .infinity, alignment: .leading).background(Color("blueBot")).clipShape(RoundedRectangle(cornerRadius: 8)).padding(.all, 10)
            
            VStack {
                Spacer()
                HStack{
                    
                    Image("perfilEjemplo").resizable().aspectRatio(contentMode: .fit).frame(width: 80, height: 80, alignment: .leading).padding(.leading)
                    
                    VStack{
                        
                        Text("Pamela Torres").foregroundColor(.white).font(.subheadline).fontWeight(.bold).frame(alignment: .leading).padding(.bottom)
                        
                        Text("Hace 12 días").foregroundColor(.white).font(.subheadline).frame(alignment: .leading).padding(.bottom)
                        
                        
                    }
                    
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                Text("He visto que como media tiene una gran calificación, y estoy completamente de acuerdo. Es el mejor juego que he jugado sin ninguna duda, combina una buena trama con una buenísima experiencia de juego libre gracias a su inmenso mapa y actividades.").foregroundColor(.white).font(.subheadline).frame(alignment: .leading)
                
                Spacer()
                
            }.frame(maxWidth: .infinity, alignment: .leading).background(Color("blueBot")).clipShape(RoundedRectangle(cornerRadius: 8)).padding(.all, 10)
            
        }
    }
}
