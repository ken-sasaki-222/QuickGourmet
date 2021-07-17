//
//  SearchListViewModel.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/15.
//

import Foundation

class SearchListViewModel: ObservableObject {
    let shopSearchFetcher = ShopSearchFetcher()
    
    // このプロパティに変更があった場合にイベント発火
    @Published var shopData: [Shop] = []
    
    init() {
        self.shopSearchFetcher.fetchShopData(completion: { shopes in
            self.shopData = shopes
        })
    }
}
