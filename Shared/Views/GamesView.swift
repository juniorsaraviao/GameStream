//
//  GamesView.swift
//  GameStream
//
//  Created by Junior Eduardo Saravia Oria on 1/04/22.
//

import SwiftUI
import Kingfisher

struct GamesView: View {
    
    @ObservedObject var allVideoGames = ViewModel()
    
    @State var gameViewIsActive: Bool = false
    @State var url: String = ""
    @State var title: String = ""
    @State var studio: String = ""
    @State var calification: String = ""
    @State var publicationYear: String = ""
    @State var description: String = ""
    @State var tags: [String] = [String]()
    @State var galleryImages: [String] = [String]()
    
    let gridShape = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    
    var body: some View {
        ZStack {
            Color("marine").ignoresSafeArea()
            
            VStack {
                Text("Juegos")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 16, leading: 0, bottom: 64, trailing: 0))
                
                ScrollView {

                    LazyVGrid(columns: gridShape, spacing: 8) {
                        ForEach(allVideoGames.gamesInfo, id: \.self) {

                            game in

                            Button(action: {

                                url = game.videosUrls.mobile
                                title = game.title
                                studio = game.studio
                                calification = game.contentRaiting
                                publicationYear = game.publicationYear
                                description = game.description
                                tags = game.tags
                                galleryImages = game.galleryImages

                                print("tap the game \(game.title)")
                                
                                gameViewIsActive = true

                            }) {
                                
                                VStack {
                                    KFImage(URL(string: game.galleryImages[0])!)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .clipShape(RoundedRectangle.init(cornerRadius: 4))
                                    .padding(.bottom, 12)
                                    
                                    Text("\(game.title)").foregroundColor(.white)
                                        .font(.footnote)
                                        .lineLimit(1)
                                        .padding(.bottom, 12.0)
                                }
                                
                            }

                        }
                    }

                }
                
            }.padding(.horizontal, 6)
            
            NavigationLink<EmptyView, GameView>(isActive: $gameViewIsActive, destination: {GameView(url: url, title: title, studio: studio, calification: calification, publicationYear: publicationYear, description: description, tags: tags, galleryImages: galleryImages)}, label: { EmptyView() })
            
            
        }.navigationBarHidden(true)
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
