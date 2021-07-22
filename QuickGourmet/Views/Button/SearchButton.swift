//
//  SearchButton.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/22.
//

import SwiftUI

struct SearchButton: View {
    var action = {}
    
    var body: some View {
        Button(action: {
            action()
        }) {
            Text("条件検索")
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
        SearchButton()
    }
}
