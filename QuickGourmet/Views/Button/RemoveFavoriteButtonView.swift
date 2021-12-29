//
//  RemoveFavoriteButtonView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/25.
//

import SwiftUI

struct RemoveFavoriteButtonView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var isShowsAlert = false
    private let favoriteVM = FavoriteViewModel()
    var onTapped: () -> Void

    var body: some View {
        Button(action: {
            isShowsAlert.toggle()
        }) {
            Text("ブックマーク解除")
                .foregroundColor(ColorManager.font_white)
                .font(.custom(FontManager.Mplus.medium, size: 18))
                .frame(width: 300, height: 44, alignment: .center)
                .background(ColorManager.gray)
                .cornerRadius(100)
                .lineLimit(1)
        }
        .alert(isPresented: $isShowsAlert) {
            Alert(
                title: Text("確認"),
                message: Text("ブックマークを解除しますか？"),
                primaryButton: .default(Text("いいえ")),
                secondaryButton: .default(Text("はい"), action: {
                    onTapped()
                    presentationMode.wrappedValue.dismiss()
                })
            )
        }
    }
}

struct RemoveFavoriteButtonView_Previews: PreviewProvider {
    static var previews: some View {
        RemoveFavoriteButtonView(onTapped: {})
    }
}
