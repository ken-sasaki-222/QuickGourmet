//
//  ShopSearchRepository.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/09/17.
//

import Foundation

class ShopSearchRepository: ShopRepositoryInterface {
    private let shopDataStore = ShopDataStore()

    func fetchShopDate(requestString: String) async throws -> [Shop] {
        do {
            let shopDate = try await shopDataStore.fetchShopDate(requestString: requestString)
            return shopDate
        } catch {
            throw error
        }
    }
}
