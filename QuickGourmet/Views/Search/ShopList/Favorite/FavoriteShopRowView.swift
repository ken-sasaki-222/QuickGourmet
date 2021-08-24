//
//  FavoriteShopRowView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/24.
//

import SwiftUI

struct FavoriteShopRowView: View {
    var favoriteShopData: FavoriteShop

    var body: some View {
        VStack {
            URLImage(urlString: favoriteShopData.photo)
                .aspectRatio(contentMode: .fit)
            HStack {
                VStack(alignment: .leading) {
                    Text(favoriteShopData.name)
                        .font(.title3)
                        .fontWeight(.medium)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.top, 4.0)
                    Text(favoriteShopData.mobileAccess)
                        .font(.headline)
                        .padding(.top, 4.0)
                        .padding(.bottom, 4.0)
                    Text(favoriteShopData.average)
                        .foregroundColor(.gray)
                        .font(.footnote)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(1)
                        .padding(.bottom, 8.0)
                }
                Spacer()
            }
        }
    }
}

struct FavoriteShopRowView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteShopRowView(favoriteShopData: mockFavoriteShopesData[0])
    }
}
