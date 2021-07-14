//
//  SearchListView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/13.
//

import SwiftUI

struct SearchListView: View {
    
    let shopData: [Shop] = mockShopesData
    
    // ObservableObjectに準拠したクラスを監視
    @ObservedObject var shopSearchFetcher = ShopSearchFetcher()
    
    var body: some View {
        NavigationView {
            List((shopData)) { shop in
                NavigationLink(destination: ShopDetailView(shopData: shopData[0])) {
                    ShopRowView(shopData: shopData[0])
                }
            }
            .navigationTitle(Text("検索結果一覧"))
        }
    }
}

struct SearchListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchListView()
    }
}
