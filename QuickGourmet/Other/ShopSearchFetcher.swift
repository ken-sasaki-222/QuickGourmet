//
//  ShopSearchFetcher.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/13.
//

import Foundation

class ShopSearchFetcher: ObservableObject {
    
    // 暫定のURL -> 本来はパラメーターに検索フォームの内容が入る
    // hotpepper gourmet search API
    private var requestString: String {
        get {
            return "https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=8038faee5cb2aff5&keyword=%E6%B8%8B%E8%B0%B7&genre=G008&count=5&format=json"
        }
    }
    
    // このプロパティに変更があった場合にイベントを通知
    @Published var shopData: [Shop] = []
    
    init() {
        fetchShopData()
    }
    
    func fetchShopData() {
        
        // force unwrap! 使いたくないのでguard
        guard let requestURL = URL(string: requestString) else {
            return
        }
        
        URLSession.shared.dataTask(with: URLRequest(url: requestURL)) { (data, response, error) in
            if let data = data {
                
                let decoder: JSONDecoder = JSONDecoder()
                guard let searchResponseData = try? decoder.decode(ShopGroup.self, from: data) else {
                    print("Decoder failure: \(error.debugDescription)")
                    return
                }
                
                DispatchQueue.main.async {
                    self.shopData = searchResponseData.shopes.reversed()
                }
            } else {
                print("json convert failed in JSONDecoder.: \(error?.localizedDescription)")
            }
        }.resume() // URLSessionタスク開始
        
    }
}
