//
//  ShopDetailInfoView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/26.
//

import SwiftUI

struct ShopDetailInfoView: View {
    var name: String
    var address: String
    var mobileAccess: String
    var average: String
    var open: String
    var genreName: String
    var logoImage: String

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                HStack {
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
                    FavoriteButton()
                }
                .padding(.init(top: 20, leading: 30, bottom: 0, trailing: 30))
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

struct ShopDetailInfoView_Previews: PreviewProvider {
    static var previews: some View {
        ShopDetailInfoView(name: mockShopesData[0].results.shop[0].name, address: mockShopesData[0].results.shop[0].address, mobileAccess: mockShopesData[0].results.shop[0].mobileAccess, average: mockShopesData[0].results.shop[0].budget.average, open: mockShopesData[0].results.shop[0].open, genreName: mockShopesData[0].results.shop[0].genre.name, logoImage: mockShopesData[0].results.shop[0].logoImage)
    }
}
