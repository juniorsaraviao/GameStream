//
//  FavoriteView.swift
//  GameStream
//
//  Created by Junior Eduardo Saravia Oria on 4/04/22.
//

import SwiftUI
import AVKit

struct FavoriteView: View {
    
    @ObservedObject var allVideoGames = ViewModel()
    
    var body: some View {
        ZStack {
            Color("marine").ignoresSafeArea()
            
            VStack {
                Text("FAVORITOS")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.bottom, 9)
                
                ScrollView {
                    
                    ForEach(allVideoGames.gamesInfo, id: \.self) { game in
                        
                        VStack(spacing: 0) {
                            let player = AVPlayer(url: URL(string: game.videosUrls.mobile)!)
                            
                            VideoPlayer(player: player)
                                .frame(height: 300)
                                .onDisappear(perform: {
                                    player.pause()
                                })
                            
                            Text("\(game.title)")
                                .foregroundColor(.white)
                                .padding()
                                .frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
                                .background(Color("blueBot"))
                                .font(.headline)
                                .clipShape(RoundedRectangle(cornerRadius: 3))
                        }
                        
                    }
                    
                    
                }.padding(.bottom, 8)
                
            }.padding(.horizontal, 6)
        }.navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
