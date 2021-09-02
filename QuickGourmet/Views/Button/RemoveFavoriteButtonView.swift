//
//  RemoveFavoriteButtonView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/25.
//

import SwiftUI

struct RemoveFavoriteButtonView: View {
    @State private var isShowsAlert = false
    @State private var isRemoveFavorite = false
    private let favoriteVM = FavoriteViewModel()
    var onTapped: () -> Void

    var body: some View {
        Button(action: {
            isShowsAlert.toggle()
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
        .alert(isPresented: $isShowsAlert) {
            Alert(title: Text("確認"),
                  message: Text("ブックマークを解除しますか？"),
                  primaryButton: .default(Text("いいえ")),
                  secondaryButton: .default(Text("はい"),
                                            action: {
                                                onTapped()
                                                isRemoveFavorite.toggle()
                                            }))
        }
        .disabled(isRemoveFavorite)
    }
}

struct RemoveFavoriteButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RemoveFavoriteButtonView(onTapped: {})
    }
}
