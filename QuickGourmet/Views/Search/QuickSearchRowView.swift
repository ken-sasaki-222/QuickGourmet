//
//  QuickSearchRowView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/02.
//

import SwiftUI

struct QuickSearchRowView: View {
    var imageString: String
    var genreName: String
    var width: CGFloat

    var body: some View {
        ZStack(alignment: .leading) {
            Image(imageString)
                .resizable()
                .frame(width: width, height: 200)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(20)
            Text("周辺の\(genreName)を検索")
                .foregroundColor(ColorManager.font_black)
                .font(.custom(FontManager.Mplus.regular, size: 18))
                .padding(5)
                .background(ColorManager.white.opacity(0.5))
                .offset(y: 50)
            TransitionImage()
                .offset(x: width * 0.8, y: 95)
        }
        .padding(.bottom, 25)
    }
}

struct QuickSearchImage_Previews: PreviewProvider {
    static var previews: some View {
        QuickSearchRowView(imageString: "food_izakaya", genreName: "居酒屋", width: 380)
    }
}
