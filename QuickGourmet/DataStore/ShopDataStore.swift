//
//  ShopDataStore.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/12/11.
//

import Foundation

class ShopDataStore {
    private let shared = URLSession.shared
    private let decoder = JSONDecoder()

    func fetchShopDate(request: String) async throws -> [Shop] {
        guard let requestUrl = URL(string: request) else {
            throw NSError(domain: "Request url notfound.", code: -1, userInfo: nil)
        }
        print("requestURL: \(requestUrl)")
        let request = URLRequest(url: requestUrl)
        let (date, response) = try await shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse,
              httpResponse.statusCode == 200
        else {
            throw NSError(domain: "HttpResponse error.", code: -2, userInfo: nil)
        }

        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let decodeDate = try decoder.decode(HotPepperResponse.self, from: date)
        let shopes = decodeDate.results.shop
        return shopes
    }
}
