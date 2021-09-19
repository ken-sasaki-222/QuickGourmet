//
//  ShopSearchRepository.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/09/17.
//

import Foundation

class ShopSearchRepository: ShopSearchRepositoryInterface {
    func fetchShopData(requestString: String, completion: @escaping ([Shop]) -> Void) {
        guard let requestUrl = URL(string: requestString) else {
            return
        }
        print("requestURL: \(requestUrl)")

        URLSession.shared.dataTask(with: URLRequest(url: requestUrl)) { data, _, error in
            guard let data = data else {
                return
            }

            let decoder = JSONDecoder()
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
        }.resume()
    }
}
