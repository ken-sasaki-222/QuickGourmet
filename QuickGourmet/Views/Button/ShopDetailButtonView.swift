//
//  ShopDetailButtonView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/23.
//

import SwiftUI

struct ShopDetailButtonView: View {
    @State private var isShown = false
    var shopUrlString: String

    var body: some View {
        Button(action: {
            self.isShown = true
        }) {
            Text("お店へ連絡")
                .foregroundColor(ColorManager.font_white)
                .font(.custom(FontManager.Mplus.medium, size: 18))
                .frame(width: 300, height: 44, alignment: .center)
                .background(ColorManager.mainColor)
                .cornerRadius(100)
                .lineLimit(1)
        }
        .sheet(isPresented: $isShown) {
            if let url = URL(string: shopUrlString) {
                SafariView(url: url)
                    .edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct ShopDetailButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ShopDetailButtonView(shopUrlString: mockShopesData[0].results.shop[0].urls.pc)
    }
}
