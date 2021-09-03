//
//  FavoriteShopDetailInfoView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/25.
//

import SwiftUI

struct FavoriteShopDetailInfoView: View {
    private let favoriteVM = FavoriteViewModel()
    var name: String
    var address: String
    var mobileAccess: String
    var average: String
    var open: String
    var genreName: String
    var urlString: String
    var documentID: String?

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
            HStack {
                // FavoriteShopDetailInfoViewではお気に入り解除するだけ
                RemoveFavoriteButtonView {
                    guard let documentID = documentID else {
                        return
                    }
                    favoriteVM.deleateFavoriteShop(documentID: documentID)
                }
                ShopDetailButtonView(shopUrlString: urlString)
            }
        }
    }
}

struct FavoriteShopDetailInfoView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteShopDetailInfoView(name: mockFavoriteShopesData[0].name, address: mockFavoriteShopesData[0].address, mobileAccess: mockFavoriteShopesData[0].mobileAccess, average: mockFavoriteShopesData[0].average, open: mockFavoriteShopesData[0].open, genreName: mockFavoriteShopesData[0].genreName, urlString: mockFavoriteShopesData[0].urlString)
    }
}
