//
//  ShopRowView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/13.
//

import SwiftUI

struct ShopRowView: View {
    @State var image: UIImage?
    var shopData: Shop

    var body: some View {
        VStack {
            URLImage(urlString: shopData.photo.pc.l)
                .aspectRatio(contentMode: .fit)
            HStack {
                VStack(alignment: .leading) {
                    Text(shopData.name)
                        .font(.title3)
                        .fontWeight(.medium)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.top, 4.0)
                    Text(shopData.mobileAccess)
                        .font(.headline)
                        .padding(.top, 4.0)
                        .padding(.bottom, 4.0)
                    Text(shopData.budget.average)
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

struct ShopRowView_Previews: PreviewProvider {
    static var previews: some View {
        ShopRowView(shopData: mockShopesData[0].results.shop[0])
    }
}
