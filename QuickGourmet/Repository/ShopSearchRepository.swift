//
//  ShopSearchRepository.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/09/17.
//

import Foundation

class ShopSearchRepository: ShopRepositoryInterface {
    private let shopDataStore = ShopDataStore()

    func fetchShopDate(request: String) async throws -> [Shop] {
        do {
            let shopDate = try await shopDataStore.fetchShopDate(request: request)
            return shopDate
        } catch {
            throw error
        }
    }
}
