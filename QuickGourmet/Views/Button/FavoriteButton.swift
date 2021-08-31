//
//  FavoriteButton.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/22.
//

import SwiftUI

struct FavoriteButton: View {
    var action: () -> Void
    @State private var isFavorite = false

    var body: some View {
        Button(action: {
            action()
            isFavorite.toggle()
        }) {
            Text(isFavorite ? "保存済み" : "ブックマーク")
                .foregroundColor(ColorManager.white)
                .font(.custom(FontManager.Mplus.medium, size: 18))
                .padding(.vertical, 10)
                .padding(.horizontal, 30)
                .background(isFavorite ? ColorManager.gray : ColorManager.red)
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
