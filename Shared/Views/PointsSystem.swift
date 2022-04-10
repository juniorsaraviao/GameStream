//
//  PointsSystem.swift
//  GameStream
//
//  Created by Junior Eduardo Saravia Oria on 10/04/22.
//

import SwiftUI

struct PointsSystem: View {
    var body: some View {
        
        
        Rectangle()
            .frame(width: 100, height: 100, alignment: .center)
            .foregroundColor(.blue)
    
    
    }
}

struct PointsSystem_Previews: PreviewProvider {
    static var previews: some View {
        PointsSystem()
        
        PointsSystem()
            .previewDevice("iPhone 8")
        
        PointsSystem()
            .previewDevice("iPad Pro (9.7-inch)")
    }
}
