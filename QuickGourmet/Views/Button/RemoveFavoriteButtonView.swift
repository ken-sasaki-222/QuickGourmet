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
            Text(isRemoveFavorite ? "解除済み" : "解除")
                .foregroundColor(Color.white)
                .font(.body)
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .background(isRemoveFavorite ? Color.gray : Color.orange)
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
