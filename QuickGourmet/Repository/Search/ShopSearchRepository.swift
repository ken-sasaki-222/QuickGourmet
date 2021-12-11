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
            let shopes = try await shopDataStore.fetchShopDate(requestString: requestString)
            return shopes
        } catch {
            throw error
        }
    }
}
