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
    
    // ObservableObjectに準拠したクラスを監視
    // @ObservedObject var shopSearchFetcher = ShopSearchFetcher()
    
    // ObservableObjectでViewModel監視
    @ObservedObject private var searchListViewModel = SearchListViewModel()
    
    var body: some View {
        NavigationView {
            List(searchListViewModel.shopData) { shop in
                NavigationLink(destination: ShopDetailView()) {
                    ShopRowView(shopData: shop)
                }
            }
            .navigationTitle("検索結果")
        }
    }
}

struct SearchListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchListView()
    }
}
