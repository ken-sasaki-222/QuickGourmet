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
        HStack {
            URLImage(urlString: shopData.photo.pc.l)
                .cornerRadius(10.0)
                .aspectRatio(contentMode: .fit)
            VStack(alignment: .leading) {
                Text(shopData.name)
                    .font(.custom(FontManager.Mplus.medium, size: 18))
                    .foregroundColor(ColorManager.font_light_dark)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(2)
                Text(shopData.mobileAccess)
                    .font(.custom(FontManager.Mplus.regular, size: 13))
                    .foregroundColor(ColorManager.font_light_dark)
                    .lineLimit(2)
                    .padding(.top, 4.0)
                    .padding(.bottom, 4.0)
                Text(shopData.budget.average)
                    .font(.custom(FontManager.Mplus.light, size: 13))
                    .foregroundColor(ColorManager.gray)
                    .fixedSize(horizontal: false, vertical: true)
                    .lineLimit(1)
            }
        }
    }
}

struct ShopRowView_Previews: PreviewProvider {
    static var previews: some View {
        ShopRowView(shopData: mockShopesData[0].results.shop[0])
    }
}
