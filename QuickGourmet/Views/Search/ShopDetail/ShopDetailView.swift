//
//  ShopDetailView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/13.
//

import SwiftUI

struct ShopDetailView: View {
    private let quickSearchVM = QuickSearchViewModel()
    private let userDefaultsDataStore = UserDefaultsDataStore()
    var shopData: Shop

    var body: some View {
        ScrollView {
            VStack {
                ZStack {
                    MapView(latitude: shopData.lat, longitude: shopData.lng)
                    LogoImage(urlString: shopData.photo.pc.l)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .aspectRatio(contentMode: .fit)
                        .shadow(radius: 7)
                        .offset(x: -130, y: 155)
                }
                .padding(.bottom, 10)
                ShopDetailInfoView(name: shopData.name,
                                   address: shopData.address,
                                   mobileAccess: shopData.mobileAccess,
                                   average: shopData.budget.average,
                                   open: shopData.open,
                                   genreName: shopData.genre.name,
                                   logoImage: shopData.logoImage,
                                   photo: shopData.photo.pc.l,
                                   latitude: shopData.lat,
                                   longitude: shopData.lng,
                                   urlString: shopData.urls.pc)
            }
        }
        .onAppear(perform: {
            switch quickSearchVM.recordShopDetailLaunchCount() {
            case true:
                NendInterstitialView().showInterstitiaStillessAD()
            case false:
                break
            }
        })
    }
}

struct ShopDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ShopDetailView(shopData: mockShopesData[0].results.shop[0])
    }
}
