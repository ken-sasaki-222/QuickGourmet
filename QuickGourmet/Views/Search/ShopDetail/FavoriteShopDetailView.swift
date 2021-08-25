//
//  FavoriteShopDetailView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/24.
//

import SwiftUI

struct FavoriteShopDetailView: View {
    private let favoriteVM = FavoriteViewModel()
    var favoriteShopData: FavoriteShop

    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    MapView(latitude: favoriteShopData.latitude, longitude: favoriteShopData.longitude)
                    LogoImage(urlString: favoriteShopData.logoImage)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 7)
                        .offset(x: -130, y: 155)
                }
                .padding(.bottom, 10)
                FavoriteShopDetailInfoView(name: favoriteShopData.name,
                                           address: favoriteShopData.address,
                                           mobileAccess: favoriteShopData.mobileAccess,
                                           average: favoriteShopData.average,
                                           open: favoriteShopData.open,
                                           genreName: favoriteShopData.genreName,
                                           documentID: favoriteShopData.documentID)
                ShopDetailButtonView(shopUrlString: favoriteShopData.urlString)
            }
        }
    }
}

struct FavoriteShopDetail_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteShopDetailView(favoriteShopData: mockFavoriteShopesData[0])
    }
}
