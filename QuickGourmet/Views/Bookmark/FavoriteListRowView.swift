//
//  FavoriteListRowView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/24.
//

import SwiftUI

struct FavoriteListRowView: View {
    var favoriteShopData: FavoriteShop

    var body: some View {
        HStack {
            URLImage(urlString: favoriteShopData.photo)
                .cornerRadius(10.0)
                .aspectRatio(contentMode: .fit)
            HStack {
                VStack(alignment: .leading) {
                    Text(favoriteShopData.name)
                        .font(.custom(FontManager.Mplus.medium, size: 18))
                        .foregroundColor(ColorManager.font_light_dark)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(2)
                    Text(favoriteShopData.mobileAccess)
                        .font(.custom(FontManager.Mplus.regular, size: 13))
                        .foregroundColor(ColorManager.font_light_dark)
                        .lineLimit(2)
                        .padding(.top, 4.0)
                        .padding(.bottom, 4.0)
                    Text(favoriteShopData.average)
                        .font(.custom(FontManager.Mplus.light, size: 13))
                        .foregroundColor(ColorManager.gray)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(1)
                }
            }
        }
    }
}

struct FavoriteShopRowView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteListRowView(favoriteShopData: mockFavoriteShopesData[0])
    }
}
