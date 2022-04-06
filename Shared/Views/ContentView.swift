//
//  ContentView.swift
//  Shared
//
//  Created by Junior Eduardo Saravia Oria on 27/03/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Spacer()
                Color(red: 22/255, green: 31/255, blue: 59/255, opacity: 1.0).ignoresSafeArea()
                
                VStack {
                    Image("AppLogo").resizable().aspectRatio(contentMode: .fit).frame(width: 250).padding(.bottom, 42)
                    
                    InicioYRegistroView()
                }
            }.navigationBarHidden(true)
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
    @State var isHomeActive = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Corre Electrónico").foregroundColor(Color("Dark-Cian"))
                
                ZStack(alignment: .leading) {
                    if email.isEmpty {
                        Text("ejemplo@gmail.com").font(.caption).accentColor(.gray)
                    }
                    
                    TextField("", text: $email).foregroundColor(.white)
                }
                
                Divider().frame(height: 1, alignment: .center).background(Color("Dark-Cian")).padding(.bottom)
                
                
                
                Text("Contraseña").foregroundColor(.white)
                
                ZStack(alignment: .leading) {
                    if password.isEmpty {
                        Text("Escribe tu contraseña").font(.caption).foregroundColor(.gray)
                    }
                    
                    SecureField("", text: $password).foregroundColor(.white)
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
        
            NavigationLink(destination: Home(), isActive: $isHomeActive, label: {
                EmptyView()
            })
        }
    }
    
    func login() {
        print("Logging in")
        isHomeActive = true
    }
}

struct RegistroView: View {
    @State var email = ""
    @State var password = ""
    @State var confirmPassword = ""
    
    var body: some View {
        ScrollView {
            
            VStack(alignment: .center) {
                Text("Elije una foto de perfil")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Puedes cambiar o elegirla más adelante")
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                    .padding(.bottom)
                
                Button(action: takePhoto, label: {
                    ZStack {
                        Image("perfilEjemplo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                        
                        Image(systemName: "camera")
                            .foregroundColor(.white)
                    }
                }).padding(.bottom)
            }
            
            VStack(alignment: .leading) {
                
                VStack(alignment: .leading) {
                Text("Corre Electrónico*").foregroundColor(Color("Dark-Cian"))

                ZStack(alignment: .leading) {
                    if email.isEmpty {
                        Text("ejemplo@gmail.com").font(.caption).accentColor(.gray)
                    }

                    TextField("", text: $email).foregroundColor(.white)
                }

                Divider().frame(height: 1, alignment: .center).background(Color("Dark-Cian")).padding(.bottom)



                Text("Contraseña*").foregroundColor(.white)

                ZStack(alignment: .leading) {
                    if password.isEmpty {
                        Text("Escribe tu contraseña").font(.caption).foregroundColor(.gray)
                    }

                    SecureField("", text: $password).foregroundColor(.white)
                }
                
                Divider().frame(height: 1, alignment: .center).background(Color("Dark-Cian")).padding(.bottom)
                
                Text("Confirmar contraseña*").foregroundColor(.white)

                ZStack(alignment: .leading) {
                    if password.isEmpty {
                        Text("Vuelve a escribir tu contraseña").font(.caption).foregroundColor(.gray)
                    }

                    SecureField("", text: $confirmPassword).foregroundColor(.white)
                }

                    Divider()
                        .frame(width:300, height: 1, alignment: .center)
                        .background(Color("Dark-Cian"))
                        .padding(.bottom)
                }


                Button(action: signUp) {
                    Text("REGÍSTRATE")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("Dark-Cian"), lineWidth: 1.0).shadow(color: .white, radius: 6))
                }.padding(.top, 30)

                Text("Inicia sesión con redes sociales")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 40)
                    .padding(.bottom, 25)

                HStack {

                    Button(action: signUp) {
                        Text("Facebook")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity/2, alignment: .center)
                            .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                            .background(RoundedRectangle(cornerRadius: 10.0).foregroundColor(Color("blueBot")))
                    }

                    Button(action: signUp) {
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Image("pantalla2").resizable()
        
        ContentView()
    }
}

func takePhoto() {
    print("Take photo")
}

func signUp() {
    print("Sign up")
}
