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
            Spacer()
            Color(red: 22/255, green: 31/255, blue: 59/255, opacity: 1.0).ignoresSafeArea()
            
            VStack {
                Image("appLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.bottom, 42)
                
                InicioYRegistroView()
            }
        }
    }
}

struct InicioYRegistroView: View {
    @State var tipoInicioSesion = true
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button("INICIA SESIÓN") {
                    tipoInicioSesion = true
                    print("Pantalla inicio sesión")
                }.foregroundColor(tipoInicioSesion ? .white : .gray)
                Spacer()
                Button("REGÍSTRATE") {
                    tipoInicioSesion = false
                    print("Pantalla regístrate")
                }.foregroundColor(!tipoInicioSesion ? .white : .gray)
                Spacer()
            }
        
            Spacer(minLength: 42)
            if tipoInicioSesion {
                InicioSesionView()
            }else {
                RegistroView()
            }
        }
    }
}

struct InicioSesionView: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Corre Electrónico").foregroundColor(Color("Dark-Cian"))
                
                ZStack(alignment: .leading) {
                    if email.isEmpty {
                        Text("ejemplo@gmail.com").font(.caption).foregroundColor(.gray)
                    }
                    
                    TextField("", text: $email)
                }
                
                Divider().frame(height: 1, alignment: .center).background(Color("Dark-Cian")).padding(.bottom)
                
                ZStack(alignment: .leading) {
                    if password.isEmpty {
                        Text("Escribe tu contraseña").font(.caption).foregroundColor(.gray)
                    }
                    
                    SecureField("", text: $password)
                }
                
                Divider().frame(height: 1, alignment: .center).background(Color("Dark-Cian")).padding(.bottom)
                
                
            }.padding(.horizontal, 77.0)
        }
    }
}

struct RegistroView: View {
    var body: some View {
        Text("Vista de Registro")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Image("pantalla1").resizable()
        
        ContentView()
    }
}
