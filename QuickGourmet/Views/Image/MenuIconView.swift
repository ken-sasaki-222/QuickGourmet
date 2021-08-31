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
                .frame(width: 20, height: 20, alignment: .center)
                .cornerRadius(3)
            Image(image)
                .resizable()
                .frame(width: 15, height: 15, alignment: .center)
        }
    }
}

struct MenuIconView_Previews: PreviewProvider {
    static var previews: some View {
        MenuIconView(image: "github_icon", color: ColorManager.black)
    }
}
