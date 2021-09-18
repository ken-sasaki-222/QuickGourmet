//
//  ShopSearchRepositoryInterface.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/09/17.
//

import Foundation

protocol ShopSearchRepositoryInterface {
    var requestString: String { get set }
    func fetchShopData(completion: @escaping ([Shop]) -> Void)
}
