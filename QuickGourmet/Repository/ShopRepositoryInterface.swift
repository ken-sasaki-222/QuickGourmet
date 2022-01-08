//
//  ShopRepositoryInterface.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/09/17.
//

import Foundation

protocol ShopRepositoryInterface {
    func fetchShopDate(request: String) async throws -> [Shop]
}
