//
//  RemoveFavoriteButtonView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/25.
//

import SwiftUI

struct RemoveFavoriteButtonView: View {
    var onTapped: () -> Void
    @State private var isRemoveFavorite = false

    var body: some View {
        Button(action: {
            onTapped()
            isRemoveFavorite.toggle()
        }) {
            Text(isRemoveFavorite ? "解除済み" : "ブックマーク解除")
                .foregroundColor(ColorManager.white)
                .font(.custom(FontManager.Mplus.medium, size: 18))
                .padding(.vertical, 10)
                .padding(.horizontal, 30)
                .background(isRemoveFavorite ? ColorManager.gray : ColorManager.icon_orange)
                .cornerRadius(100)
                .lineLimit(1)
        }
        .disabled(isRemoveFavorite)
    }
}

struct RemoveFavoriteButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RemoveFavoriteButtonView(onTapped: {})
    }
}
