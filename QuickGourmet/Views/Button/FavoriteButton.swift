//
//  FavoriteButton.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/22.
//

import SwiftUI

struct FavoriteButton: View {
    @State private var isFavorite = false
    var action: () -> Void

    var body: some View {
        Button(action: {
            action()
            isFavorite.toggle()
        }) {
            Text(isFavorite ? "保存済み" : "ブックマーク")
                .foregroundColor(ColorManager.font_white)
                .font(.custom(FontManager.Mplus.medium, size: 18))
                .frame(width: 300, height: 44, alignment: .center)
                .background(isFavorite ? ColorManager.gray : ColorManager.icon_gold)
                .cornerRadius(100)
                .lineLimit(1)
        }
        .disabled(isFavorite)
    }
}

struct FavoriteButton_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButton(action: {})
    }
}
