//
//  ShopDetailInfoView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/26.
//

import SwiftUI

struct ShopDetailInfoView: View {
    private let favoriteVM = FavoriteViewModel()
    var name: String
    var address: String
    var mobileAccess: String
    var average: String
    var open: String
    var genreName: String
    var logoImage: String
    var photo: String
    var latitude: Double
    var longitude: Double
    var urlString: String

    var body: some View {
        VStack(alignment: .trailing) {
            FavoriteButton(action: {
                // ShopDetailInfoViewではお気に入りするだけ
                let favoriteShop = FavoriteShop(
                    name: name,
                    address: address,
                    mobileAccess: mobileAccess,
                    average: average,
                    open: open,
                    genreName: genreName,
                    logoImage: logoImage,
                    photo: photo,
                    latitude: latitude,
                    longitude: longitude,
                    urlString: urlString,
                    documentID: nil
                )
                favoriteVM.saveFavoriteShop(favoriteShop: favoriteShop)
            })
                .padding(.init(top: 0, leading: 0, bottom: 0, trailing: 60))
            HStack {
                VStack(alignment: .leading) {
                    VStack {
                        Text(name)
                            .font(.title3)
                            .fontWeight(.medium)
                            .lineLimit(2)
                        Text(genreName)
                            .font(.footnote)
                            .foregroundColor(.gray)
                            .padding(.top, 1)
                    }
                    .padding(.init(top: 10, leading: 30, bottom: 0, trailing: 30))
                    HStack {
                        MenuIconView(image: "pin_icon", color: ColorManager.icon_blue)
                        Text(address)
                            .font(.body)
                            .lineLimit(3)
                    }
                    .padding(.init(top: 10, leading: 30, bottom: 0, trailing: 30))
                    HStack {
                        MenuIconView(image: "walk_icon", color: ColorManager.icon_green)
                        Text(mobileAccess)
                            .font(.body)
                            .lineLimit(3)
                    }
                    .padding(.init(top: 10, leading: 30, bottom: 0, trailing: 30))
                    HStack {
                        MenuIconView(image: "time_icon", color: ColorManager.icon_orange)
                        Text(open)
                            .font(.body)
                            .lineLimit(5)
                    }
                    .padding(.init(top: 10, leading: 30, bottom: 5, trailing: 30))
                    HStack {
                        MenuIconView(image: "maney_icon", color: ColorManager.icon_purple)
                        Text(average)
                            .font(.body)
                            .lineLimit(3)
                    }
                    .padding(.init(top: 10, leading: 30, bottom: 20, trailing: 30))
                }
            }
        }
    }
}

struct ShopDetailInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ShopDetailInfoView(name: mockShopesData[0].results.shop[0].name, address: mockShopesData[0].results.shop[0].address, mobileAccess: mockShopesData[0].results.shop[0].mobileAccess, average: mockShopesData[0].results.shop[0].budget.average, open: mockShopesData[0].results.shop[0].open, genreName: mockShopesData[0].results.shop[0].genre.name, logoImage: mockShopesData[0].results.shop[0].logoImage, photo: mockShopesData[0].results.shop[0].photo.pc.l, latitude: mockShopesData[0].results.shop[0].lat, longitude: mockShopesData[0].results.shop[0].lng, urlString: mockShopesData[0].results.shop[0].urls.pc)
    }
}
