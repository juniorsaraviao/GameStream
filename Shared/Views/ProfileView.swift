//
//  ProfileView.swift
//  GameStream
//
//  Created by Junior Eduardo Saravia Oria on 6/04/22.
//

import SwiftUI

struct ProfileView: View {
    
    @State var username: String = "Lorem"
    @State var profileImage : UIImage = UIImage(named: "perfilEjemplo")!
    
    var body: some View {
        ZStack {
            Color("marine").ignoresSafeArea()
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
            
            
            VStack {
                
                Text("Perfil")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: .infinity,alignment: .center)
                    .padding()
                
                VStack {
                    
                    Image(uiImage: profileImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 118, height: 118)
                        .clipShape(Circle())
                    
                    Text(username)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                }.padding(EdgeInsets(top: 16, leading: 0, bottom: 32, trailing: 0))
                
                Text("Ajustes")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: .infinity,alignment: .leading)
                    .padding(.leading, 18)
                
                SettingsModule()
                
                Spacer()
            }
            
            
        }.onAppear(
            perform: {
                
                if returnUiImage(named: "profilePhoto") != nil {
                    profileImage = returnUiImage(named: "profilePhoto")!
                } else {
                    print("File not found")
                }
                
                print("Review username data")
                
                if UserDefaults.standard.object(forKey: "userData") != nil {
                    username = UserDefaults.standard.stringArray(forKey: "userData")![2]
                }else {
                    print("Nothing saved")
                }
            }
        ).onDisappear(perform: {
            print("onDisappear")
        })
    }
    
    func returnUiImage(named: String) -> UIImage? {
        
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
        } else {
            return nil
        }
            
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

struct SettingsModule : View {
    
    @State var isToggleOn = true
    @State var isEditProfileViewActive = false
    
    var body: some View {
        VStack(spacing: 3) {
            
            Button(action: {}) {
                HStack {
                    Text("Cuenta")
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Text(">")
                        .foregroundColor(.white)
                    
                }.padding()
            }.background(Color("blueBot"))
             .clipShape(RoundedRectangle(cornerRadius: 1))
            
            
            Button(action: {}) {
                HStack {
                    Text("Notificaciones")
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Toggle("", isOn: $isToggleOn)
                    
                }.padding()
            }.background(Color("blueBot"))
             .clipShape(RoundedRectangle(cornerRadius: 1))
            
            
            Button(action: { isEditProfileViewActive = true }) {
                HStack {
                    Text("Editar perfil")
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Text(">")
                        .foregroundColor(.white)
                    
                }.padding()
            }.background(Color("blueBot"))
             .clipShape(RoundedRectangle(cornerRadius: 1))
            
            
            Button(action: {}) {
                HStack {
                    Text("Califica esta aplicación")
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Text(">")
                        .foregroundColor(.white)
                    
                }.padding()
            }.background(Color("blueBot"))
             .clipShape(RoundedRectangle(cornerRadius: 1))
            
            NavigationLink(destination: EditProfileView(), isActive: $isEditProfileViewActive, label: {
                EmptyView()
            })
            
        }
    }
}
