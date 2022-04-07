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
    var body: some View {
        Text("")
    }
}
