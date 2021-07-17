//
//  ShopSearchFetcher.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/13.
//

import Foundation

class ShopSearchFetcher {
    
    // 暫定のURL -> 本来はパラメーターに検索フォームの内容が入る
    // hotpepper gourmet search API
    private var requestString: String {
        get {
            return "https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=8038faee5cb2aff5&keyword=%E6%B8%8B%E8%B0%B7&genre=G008&count=100&format=json"
        }
    }
    
    func fetchShopData(completion: @escaping ([Shop]) -> Void) {
        // force unwrap! 使いたくないのでguard
        guard let requestURL = URL(string: requestString) else {
            return
        }
        
        URLSession.shared.dataTask(with: URLRequest(url: requestURL)) { (data, response, error) in
            guard let data = data else {
                return
            }
            
            let decoder: JSONDecoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let searchResponseData = try decoder.decode(HotPepperResponse.self, from: data)
                print("JSONDecode succeeded.")
                
                DispatchQueue.main.async {
                    completion(searchResponseData.results.shop)
                }
            } catch {
                print("JSONDecode Failure Overview.: \(error.localizedDescription)")
                print("Details of JSONDecode failure.: \(error)")
            }
        }.resume() // URLSessionタスク開始
        
    }
}
