//
//  MockShopSearchRepository.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/09/17.
//

import Foundation

class MockShopSearchRepository: ShopSearchRepositoryInterface {
    func fetchShopData(requestString: String, completion: @escaping ([Shop]) -> Void) {
        completion(mockShopesData[0].results.shop)
    }
}
