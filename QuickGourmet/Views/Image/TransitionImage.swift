//
//  TransitionImage.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/03.
//

import SwiftUI

struct TransitionImage: View {
    var body: some View {
        ZStack {
            Color.green
                .clipShape(Circle())
                .frame(width: 50, height: 50, alignment: .center)
            Image(systemName: "figure.walk")
                .resizable()
                .foregroundColor(.white)
                .frame(width: 10, height: 15, alignment: .center)
        }
    }
}

struct ArrowImage_Previews: PreviewProvider {
    static var previews: some View {
        TransitionImage()
    }
}
