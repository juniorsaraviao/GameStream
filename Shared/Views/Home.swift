//
//  Home.swift
//  GameStream
//
//  Created by Junior Eduardo Saravia Oria on 29/03/22.
//

import SwiftUI
import AVKit

struct Home: View {
    @State var selectedTab: Int = 2
    
    var body: some View {
        
        TabView(selection: $selectedTab) {
            
            Text("Perfil")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "person")
                    Text("Perfil")
                }.tag(0)
            
            GamesView()
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Juegos")
                }.tag(1)
            
            HomeScreen()
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "house")
                    Text("Inicio")
                }.tag(2)
            
            Text("Favoritos")
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "heart")
                    Text("Home")
                }.tag(3)
        }.accentColor(.white)
        
    }
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color("TabBar-Color"))
        
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        UITabBar.appearance().isTranslucent = true
        
        print("Init home view")
    }
}


struct HomeScreen : View {
    @State var lookupText = ""
    
    var body: some View {
        ZStack {
            Color("marine").ignoresSafeArea()
            
            VStack {
                
                Image("appLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.horizontal, 11)
                
                HStack {
                    Button(action: lookUp) {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(lookupText.isEmpty ? .yellow : Color("Dark-Cian"))
                    }
                    
                    ZStack(alignment: .leading) {
                        
                        if lookupText.isEmpty {
                            Text("Buscar un video")
                                .foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1))
                                .font(.system(size: 20))
                        }
                        
                        TextField("", text: $lookupText)
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                    }
                }
                .padding([.top, .leading, .bottom], 11)
                .background(Color("blueBot"))
                .clipShape(Capsule())
                
                ScrollView(showsIndicators: false) {
                    SubModuleHome()
                }
                
            }.padding(.horizontal, 18)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
    
    func lookUp() {
        print("Look up \(lookupText)")
    }
}

struct SubModuleHome : View {
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
        @State var isPlayerActive = false
        let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]
    
    var body: some View {
        
        VStack {
            Text("LOS MÁS POPULARES")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
                .padding(.top)
            
            ZStack {
                
                Button(action: {
                    url = urlVideos[0]
                    print("URL: \(url)")
                    isPlayerActive = true
                }) {
                    VStack(spacing: 0) {
                        Image("13-swiftuiapps-2105-thewitcher")
                            .resizable()
                            .scaledToFit()
                        Text("The Witcher 3")
                            .frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
                            .background(Color("blueBot"))
                            .font(.headline)
                    }
                }
                
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 42, height: 42)
                
            }.frame(minWidth: 0, maxWidth: .infinity,alignment: .center)
                .padding(.vertical)
            
            Text("CATEGORÍAS SUGERIDAS PARA TI")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Button(action: {}) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("blueBot"))
                                .frame(width: 160, height: 90)
                            
                            Image("FPS")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 42, height: 42)
                        }
                    }
                    
                    Button(action: {}) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("blueBot"))
                                .frame(width: 160, height: 90)
                            
                            Image("RPG")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 42, height: 42)
                        }
                    }
                    
                    Button(action: {}) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color("blueBot"))
                                .frame(width: 160, height: 90)
                            
                            Image("open-world")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 42, height: 42)
                        }
                    }
                }
            }
            
            Text("RECOMENDADOS PARA TI")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Button(action: {
                        url = urlVideos[1]
                        print("URL: \(url)")
                        isPlayerActive = true
                    }) {
                        Image("13-swiftuiapps-2105-assassins_creed")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 240, height: 135)
                    }
                    
                    Button(action: {
                        url = urlVideos[2]
                        print("URL: \(url)")
                        isPlayerActive = true
                    }) {
                        Image("13-swiftuiapps-2105-battkefield")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 240, height: 135)
                    }
                    
                    Button(action: {
                        url = urlVideos[3]
                        print("URL: \(url)")
                        isPlayerActive = true
                    }) {
                        Image("13-swiftuiapps-2105-dest")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 240, height: 135)
                    }
                }
            }
            
            
            Text("VIDEO QUE PODRÍAN GUSTARTE")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
                .padding(.top, 25)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    Button(action: {
                        url = urlVideos[4]
                        print("URL: \(url)")
                        isPlayerActive = true
                    }) {
                        ZStack {
                            Image("13-swiftuiapps-2105-spiderman")
                                .resizable()
                                .scaledToFill()
                            .frame(width: 240, height: 135)
                            
                            Image(systemName: "play.circle.fill")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 42, height: 42)
                        }
                    }
                    
                    Button(action: {
                        url = urlVideos[5]
                        print("URL: \(url)")
                        isPlayerActive = true
                    }) {
                        ZStack {
                            Image("13-swiftuiapps-2105-rectangle6")
                                .resizable()
                                .scaledToFill()
                            .frame(width: 240, height: 135)
                            
                            Image(systemName: "play.circle.fill")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 42, height: 42)
                        }
                    }
                    
                    Button(action: {
                        url = urlVideos[6]
                        print("URL: \(url)")
                        isPlayerActive = true
                    }) {
                        ZStack {
                            Image("13-swiftuiapps-2105-titanfall2")
                                .resizable()
                                .scaledToFill()
                            .frame(width: 240, height: 135)
                            
                            Image(systemName: "play.circle.fill")
                                .resizable()
                                .foregroundColor(.white)
                                .frame(width: 42, height: 42)
                        }
                    }
                }
            }
        }
        
        NavigationLink(destination: VideoPlayer(player: AVPlayer(url: URL(string: url)!)).frame(width: 400, height: 300), isActive: $isPlayerActive) {
            EmptyView()
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
