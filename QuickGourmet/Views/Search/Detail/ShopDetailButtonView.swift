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
        SearchButtonView(text: "お店へ連絡") {
            self.isShown = true
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
