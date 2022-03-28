//
//  ContentView.swift
//  Shared
//
//  Created by Junior Eduardo Saravia Oria on 27/03/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
            Color(red: 22/255, green: 31/255, blue: 59/255, opacity: 1.0).ignoresSafeArea()
            
            VStack {
                Image("appLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250)
                
                InicioYRegistroView()
            }
        }
    }
}

struct InicioYRegistroView: View {
    var body: some View {
        VStack {
            HStack {
                Text("INICIA SESIÓN")
                
                Text("REGÍSTRATE")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Image("pantalla1").resizable()
        
        ContentView()
    }
}
