//
//  ShopSearchRepositoryInterface.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/09/17.
//

import Foundation

protocol ShopSearchRepositoryInterface {
    func fetchShopData(requestString: String, completion: @escaping ([Shop]) -> Void)
}
