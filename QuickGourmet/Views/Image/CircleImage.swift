//
//  CircleImage.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/23.
//

import SwiftUI

struct CircleImage: View {
    var imageUrlString: String
    
    var body: some View {
        URLImage(urlString: imageUrlString)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage(imageUrlString: mockShopesData[0].results.shop[0].photo.pc.l)
    }
}
