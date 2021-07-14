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
            URLImage(url: shopData.photo.mobile.l)
                .aspectRatio(contentMode: .fit)
            
            Text(shopData.name)
            
        }
        
    }
}

struct ShopRowView_Previews: PreviewProvider {
    static var previews: some View {
        ShopRowView(shopData: mockShopesData[0])
    }
}
