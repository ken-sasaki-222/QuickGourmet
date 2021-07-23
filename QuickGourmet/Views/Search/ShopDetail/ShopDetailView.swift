//
//  ShopDetailView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/13.
//

import SwiftUI

struct ShopDetailView: View {
    var shopData: Shop
    
    var body: some View {
        ScrollView {
            CircleImage(imageUrlString: shopData.photo.pc.l)
            
            ShopDetailButtonView(shopUrlString: shopData.urls.pc)
        }
    }
}

struct ShopDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ShopDetailView(shopData: mockShopesData[0].results.shop[0])
    }
}
