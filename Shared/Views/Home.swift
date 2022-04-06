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
            
            FavoriteView()
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favoritos")
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
    
    var body: some View {
        ZStack {
            Color("marine").ignoresSafeArea()
            
            VStack {
                
                Image("AppLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.horizontal, 11)
                
                ScrollView(showsIndicators: false) {
                    SubModuleHome()
                }
                
            }.padding(.horizontal, 18)
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct SubModuleHome : View {
    @State var lookupText = ""
    @State var isGameInfoEmpty = false
    
    @ObservedObject var foundGame = SearchGame()
    @State var isGameViewActive = false
    
    @State var url: String = ""
    @State var title: String = ""
    @State var studio: String = ""
    @State var calification: String = ""
    @State var publicationYear: String = ""
    @State var description: String = ""
    @State var tags: [String] = [String]()
    @State var galleryImages: [String] = [String]()
    
    var body: some View {
        
        VStack {
            
            HStack {
                Button(action: {
                    watchGame(name: lookupText)
                }) {
                    Image(systemName: "magnifyingglass")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(lookupText.isEmpty ? .yellow : Color("Dark-Cian"))
                }.alert(isPresented: $isGameInfoEmpty) {
                    Alert(title: Text("Error"), message: Text("No se encontró el juego"), dismissButton: .default(Text("Entendido")))
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
            
            
            Text("LOS MÁS POPULARES")
                .font(.title3)
                .foregroundColor(.white)
                .bold()
                .frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
                .padding(.top)
            
            ZStack {
                
                Button(action: { watchGame(name: "The Witcher 3") }) {
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
                    Button(action: {watchGame(name: "Crash Bandicoot")}) {
                        Image("13-swiftuiapps-2105-assassins_creed")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 240, height: 135)
                    }
                    
                    Button(action: {watchGame(name: "DEATH STRANDING")}) {
                        Image("13-swiftuiapps-2105-battkefield")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 240, height: 135)
                    }
                    
                    Button(action: {watchGame(name: "Abzu")}) {
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
                    Button(action: {watchGame(name: "Hades")}) {
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
                    
                    Button(action: {watchGame(name: "Cuphead")}) {
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
                    
                    Button(action: {watchGame(name: "Grand Theft Auto V")}) {
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
        
        NavigationLink(destination: GameView(url: url, title: title, studio: studio, calification: calification, publicationYear: publicationYear, description: description, tags: tags, galleryImages: galleryImages), isActive: $isGameViewActive) {
            EmptyView()
        }
        
    }
    
    func watchGame(name: String) {
        foundGame.search(gameName: name)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
            print("# of elements: \(foundGame.gamesInfo.count)")
            
            if foundGame.gamesInfo.count == 0 {
                isGameInfoEmpty = true
            } else {
                url = foundGame.gamesInfo[0].videosUrls.mobile
                title = foundGame.gamesInfo[0].title
                studio = foundGame.gamesInfo[0].studio
                calification = foundGame.gamesInfo[0].contentRaiting
                publicationYear = foundGame.gamesInfo[0].publicationYear
                description = foundGame.gamesInfo[0].description
                tags = foundGame.gamesInfo[0].tags
                galleryImages = foundGame.gamesInfo[0].galleryImages
                
                isGameViewActive = true
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
