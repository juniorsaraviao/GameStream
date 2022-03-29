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
                        Text("ejemplo@gmail.com").font(.caption).accentColor(.gray)
                    }
                    
                    TextField("", text: $email)
                }
                
                Divider().frame(height: 1, alignment: .center).background(Color("Dark-Cian")).padding(.bottom)
                
                
                
                Text("Contraseña").foregroundColor(.white)
                
                ZStack(alignment: .leading) {
                    if password.isEmpty {
                        Text("Escribe tu contraseña").font(.caption).foregroundColor(.gray)
                    }
                    
                    SecureField("", text: $password)
                }
                
                Divider().frame(height: 1, alignment: .center).background(Color("Dark-Cian")).padding(.bottom)
                
                Text("Olvidate tu contraseña?").foregroundColor(Color("Dark-Cian")).font(.footnote).frame(width: 300, alignment: .trailing)
                    .padding(.bottom)
                
                
                Button(action: login) {
                    Text("INICIA SESIÓN")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("Dark-Cian"), lineWidth: 1.0).shadow(color: .white, radius: 6))
                }.padding(.top, 30)
                
                Text("Inicia sesión con redes sociales")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 80)
                    .padding(.bottom, 25)
                
                HStack {
                    
                    Button(action: login) {
                        Text("Facebook")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity/2, alignment: .center)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                            .background(RoundedRectangle(cornerRadius: 10.0).foregroundColor(Color("blueBot")))
                    }
                    
                    Button(action: login) {
                        Text("Twitter")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity/2, alignment: .center)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                            .background(RoundedRectangle(cornerRadius: 10.0).foregroundColor(Color("blueBot")))
                    }
                }
                
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

func login() {
    print("Logging in")
}
