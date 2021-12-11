//
//  ShopRepositoryInterface.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/09/17.
//

import Foundation

protocol ShopRepositoryInterface {
    func fetchShopData(requestString: String, completion: @escaping (Result<[Shop], Error>) -> Void)
}
