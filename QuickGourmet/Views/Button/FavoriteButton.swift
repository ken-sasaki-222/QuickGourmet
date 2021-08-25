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
            Text(isFavorite ? "保存済み" : "保存")
                .foregroundColor(Color.white)
                .font(.body)
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .background(isFavorite ? Color.gray : Color.red)
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
