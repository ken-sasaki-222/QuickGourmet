//
//  SearchListView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/13.
//

import SwiftUI

struct SearchListView: View {

    // インターフェース定義用Mock
    // let shopData: [Response] = mockShopesDate
    // @ObservedObject var shopSearchFetcher = ShopSearchFetcher()
    
    @ObservedObject var searchVM: SearchViewModel
    
    var body: some View {
        List(searchVM.shopData) { shop in
            NavigationLink(destination: ShopDetailView(shopData: shop)) {
                ShopRowView(shopData: shop)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

//struct SearchListView_Previews: PreviewProvider {
//    var searchVM: SearchViewModel
//    static var previews: some View {
//        SearchListView(searchVM: searchVM)
//    }
//}
