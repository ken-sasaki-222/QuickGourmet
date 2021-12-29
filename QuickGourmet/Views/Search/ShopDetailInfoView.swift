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
        VStack {
            Text("ジャンル：\(genreName)")
                .font(.custom(FontManager.Mplus.light, size: 13))
                .foregroundColor(ColorManager.gray)
                .padding(.top, 30)
                .padding(.leading, 180)
            VStack(alignment: .leading) {
                Text(name)
                    .font(.custom(FontManager.Mplus.medium, size: 18))
                    .foregroundColor(ColorManager.font_light_dark)
                    .lineLimit(2)
                    .padding(.init(top: 10, leading: 30, bottom: 0, trailing: 30))
                HStack {
                    MenuIconView(image: "pin_icon", color: ColorManager.icon_blue)
                    Text(address)
                        .font(.custom(FontManager.Mplus.regular, size: 16))
                        .foregroundColor(ColorManager.font_light_dark)
                        .lineLimit(3)
                }
                .padding(.init(top: 10, leading: 30, bottom: 0, trailing: 30))
                HStack {
                    MenuIconView(image: "walk_icon", color: ColorManager.icon_green)
                    Text(mobileAccess)
                        .font(.custom(FontManager.Mplus.regular, size: 16))
                        .foregroundColor(ColorManager.font_light_dark)
                        .lineLimit(3)
                }
                .padding(.init(top: 10, leading: 30, bottom: 0, trailing: 30))
                HStack {
                    MenuIconView(image: "time_icon", color: ColorManager.icon_orange)
                    Text(open)
                        .font(.custom(FontManager.Mplus.regular, size: 16))
                        .foregroundColor(ColorManager.font_light_dark)
                        .lineLimit(5)
                }
                .padding(.init(top: 10, leading: 30, bottom: 5, trailing: 30))
                HStack {
                    MenuIconView(image: "maney_icon", color: ColorManager.icon_purple)
                    Text(average)
                        .font(.custom(FontManager.Mplus.regular, size: 16))
                        .foregroundColor(ColorManager.font_light_dark)
                        .lineLimit(3)
                }
                .padding(.init(top: 10, leading: 30, bottom: 10, trailing: 30))
            }
            VStack {
                FavoriteButtonView(action: {
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
                ShopDetailButtonView(shopUrlString: urlString)
            }
        }
    }
}

struct ShopDetailInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ShopDetailInfoView(name: mockShopesData[0].results.shop[0].name, address: mockShopesData[0].results.shop[0].address, mobileAccess: mockShopesData[0].results.shop[0].mobileAccess, average: mockShopesData[0].results.shop[0].budget.average, open: mockShopesData[0].results.shop[0].open, genreName: mockShopesData[0].results.shop[0].genre.name, logoImage: mockShopesData[0].results.shop[0].logoImage, photo: mockShopesData[0].results.shop[0].photo.pc.l, latitude: mockShopesData[0].results.shop[0].lat, longitude: mockShopesData[0].results.shop[0].lng, urlString: mockShopesData[0].results.shop[0].urls.pc)
    }
}
