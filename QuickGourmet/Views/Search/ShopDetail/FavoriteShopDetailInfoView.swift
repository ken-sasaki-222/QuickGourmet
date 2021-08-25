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
    var documentID: String?

    var body: some View {
        VStack(alignment: .trailing) {
            // FavoriteShopDetailInfoViewではお気に入り解除するだけ
            RemoveFavoriteButtonView(onTapped: {
                guard let documentID = documentID else {
                    return
                }
                favoriteVM.deleateFavoriteShop(documentID: documentID)
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
                        Image(systemName: "mappin.circle")
                        Text(address)
                            .font(.body)
                            .lineLimit(3)
                    }
                    .padding(.init(top: 10, leading: 30, bottom: 0, trailing: 30))
                    HStack {
                        Image(systemName: "figure.walk")
                        Text(mobileAccess)
                            .font(.body)
                            .lineLimit(3)
                    }
                    .padding(.init(top: 10, leading: 30, bottom: 0, trailing: 30))
                    HStack {
                        Image(systemName: "clock")
                        Text(open)
                            .font(.body)
                            .lineLimit(5)
                    }
                    .padding(.init(top: 10, leading: 30, bottom: 5, trailing: 30))
                    HStack {
                        Image(systemName: "dollarsign.circle")
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

struct FavoriteShopDetailInfoView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteShopDetailInfoView(name: mockFavoriteShopesData[0].name, address: mockFavoriteShopesData[0].address, mobileAccess: mockFavoriteShopesData[0].mobileAccess, average: mockFavoriteShopesData[0].average, open: mockFavoriteShopesData[0].open, genreName: mockFavoriteShopesData[0].genreName)
    }
}
