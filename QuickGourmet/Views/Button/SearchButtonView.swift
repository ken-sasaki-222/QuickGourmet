//
//  SearchButton.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/22.
//

import SwiftUI

struct SearchButtonView: View {
    var text: String
    var action = {}

    var body: some View {
        Button(action: {
            action()
        }) {
            Text(text)
                .foregroundColor(Color.white)
                .fontWeight(.medium)
                .font(.headline)
                .padding(.vertical, 10)
                .padding(.horizontal, 30)
                .background(Color.green)
                .cornerRadius(100)
                .lineLimit(1)
        }
    }
}

struct SearchButton_Previews: PreviewProvider {
    static var previews: some View {
        SearchButtonView(text: "検索")
    }
}
