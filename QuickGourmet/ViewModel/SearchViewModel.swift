//
//  SearchViewModel.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/18.
//

import Foundation

class SearchViewModel: ObservableObject {
    @Published var shopSearchFetcher = ShopSearchFetcher()
    @Published var shopData: [Shop] = []
    var urlString: String?
    
    // SearchViewから値を受け取ってModelに渡す
    func callShopSearchFetcher() {
        guard let encodeItem = urlString else {
            return
        }
        // encodeItemをエンコード
        guard let encodingString = encodeItem.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) else {
            return
        }
        shopSearchFetcher.requestString = encodingString
        shopSearchFetcher.fetchShopData { shopes in
            self.shopData = shopes
            print("shopData: \(self.shopData)")
        }
    }
}
