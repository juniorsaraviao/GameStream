//
//  EditProfileView.swift
//  GameStream
//
//  Created by Junior Eduardo Saravia Oria on 6/04/22.
//

import SwiftUI

struct EditProfileView: View {
    var body: some View {
        ZStack {
            Color("marine").ignoresSafeArea()
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            
            ScrollView {
                
                VStack {
                    
                    Button(action: {}) {
                        ZStack {
                            Image("perfilEjemplo")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 118, height: 118)
                                .clipShape(Circle())
                            
                            Image(systemName: "camera")
                                .foregroundColor(.white)
                        }
                    }
                    
                    
                    
                }.padding(.bottom, 18)
                
                EditModule()
                
            }
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}

struct EditModule : View {
    
    @State var email = ""
    @State var password = ""
    @State var username = ""
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Correo electrónico")
                .foregroundColor(Color("Dark-Cian"))
            
            ZStack(alignment: .leading) {
                if email.isEmpty {
                    Text("ejemplo@gmail.com")
                        .font(.caption)
                        .accentColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1))
                }
                
                TextField("", text: $email)
            }
            
            Divider()
                .frame(height: 1)
                .background(Color("Dark-Cian"))
            
            Text("Contraseña")
                .foregroundColor(.white)
            
            ZStack(alignment: .leading) {
                if password.isEmpty {
                    Text("Introduce tu contraseña")
                        .font(.caption)
                        .foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1))
                }
                
                SecureField("", text: $password)
                    .foregroundColor(.white)
            }
            
            Divider()
                .frame(height: 1)
                .background(Color("Dark-Cian"))
            
            
            Text("Nombre")
                .foregroundColor(.white)
            
            ZStack(alignment: .leading) {
                if username.isEmpty {
                    Text("Introduce tu nombre de usuario")
                        .font(.caption)
                        .foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255, opacity: 1))
                }
                
                TextField("", text: $username)
                    .foregroundColor(.white)
            }
            
            Divider()
                .frame(height: 1)
                .background(Color("Dark-Cian"))
                .padding(.bottom, 32)
            
            Button(action: updateData) {
                Text("ACTUALIZAR DATOS")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                    .overlay(RoundedRectangle(cornerRadius: 6.0).stroke(Color("Dark-Cian"), lineWidth: 1.0).shadow(color: .white, radius: 6))
            }.padding(.bottom)
                
        }.padding(.horizontal, 42)
        
    }
    
    func updateData() {
        print("Saving user data...")
    }
}
