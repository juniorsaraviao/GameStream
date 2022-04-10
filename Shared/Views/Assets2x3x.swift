//
//  Assets2x3x.swift
//  GameStream
//
//  Created by Junior Eduardo Saravia Oria on 10/04/22.
//

import SwiftUI

struct Assets2x3x: View {
    var body: some View {
        Image("platzi")
    }
}

struct Assets2x3x_Previews: PreviewProvider {
    static var previews: some View {
        Assets2x3x()
        
        Assets2x3x()
            .previewDevice("iPhone 8")
        
        Assets2x3x()
            .previewDevice("iPhone 11 Pro Max")
    }
}
