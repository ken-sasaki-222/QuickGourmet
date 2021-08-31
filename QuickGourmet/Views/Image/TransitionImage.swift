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
            ColorManager.mainColor
                .clipShape(Circle())
                .frame(width: 50, height: 50, alignment: .center)
            Image("walk_icon")
                .resizable()
                .foregroundColor(ColorManager.white)
                .frame(width: 25, height: 25, alignment: .center)
        }
    }
}

struct ArrowImage_Previews: PreviewProvider {
    static var previews: some View {
        TransitionImage()
    }
}
