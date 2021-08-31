//
//  MenuIconView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/31.
//

import SwiftUI

struct MenuIconView: View {
    var image: String
    var color: Color

    var body: some View {
        ZStack {
            color
                .frame(width: 25, height: 25, alignment: .center)
                .cornerRadius(3)
            Image(image)
                .resizable()
                .frame(width: 18, height: 18, alignment: .center)
        }
    }
}

struct MenuIconView_Previews: PreviewProvider {
    static var previews: some View {
        MenuIconView(image: "github_icon", color: ColorManager.black)
    }
}
