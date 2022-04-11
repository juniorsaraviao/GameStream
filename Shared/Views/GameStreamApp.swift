//
//  GameStreamApp.swift
//  Shared
//
//  Created by Junior Eduardo Saravia Oria on 27/03/22.
//

import SwiftUI

@main
struct GameStreamApp: App {
    
    init() {
        // Punto de partida de la app
    }
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.onChange(of: scenePhase) { phase in
            print(phase)
            
            if phase == .inactive {
                print("The app is inactive, data will be saved...")
            }
            
        }
    }
}
