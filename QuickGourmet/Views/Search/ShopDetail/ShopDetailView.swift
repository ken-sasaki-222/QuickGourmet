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
            VStack {
                MapView(latitude: shopData.lat, longitude: shopData.lng)
                    .frame(height: 350)
                CircleImage(imageUrlString: shopData.photo.pc.l)
                    .offset(y: -130)
                    .padding(.bottom, -130)
                ShopDetailButtonView(shopUrlString: shopData.urls.pc)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ShopDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ShopDetailView(shopData: mockShopesData[0].results.shop[0])
    }
}
