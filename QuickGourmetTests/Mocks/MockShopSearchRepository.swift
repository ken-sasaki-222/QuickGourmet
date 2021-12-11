//
//  MockShopSearchRepository.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/09/17.
//

import Foundation

class MockShopSearchRepository: ShopRepositoryInterface {
    func fetchShopData(requestString: String, completion: @escaping (Result<[Shop], Error>) -> Void) {
        guard let requestUrl = URL(string: requestString) else {
            return
        }
        URLSession.shared.dataTask(with: URLRequest(url: requestUrl)) { data, _, error in
            guard let data = data else {
                return
            }
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                let searchResponseData = try decoder.decode(HotPepperResponse.self, from: data)
                print("JSONDecode succeeded.")

                completion(.success(searchResponseData.results.shop))
            } catch {
                print(".failure:", error)
                completion(.failure(error))
            }
        }.resume()
    }
}
