//
//  SearchButton.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/22.
//

import SwiftUI

struct SearchButton: View {
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
                .padding(.vertical, 15)
                .padding(.horizontal, 100)
                .background(Color.red)
                .cornerRadius(100)
        }
    }
}

struct SearchButton_Previews: PreviewProvider {
    static var previews: some View {
        SearchButton(text: "条件検索")
    }
}
