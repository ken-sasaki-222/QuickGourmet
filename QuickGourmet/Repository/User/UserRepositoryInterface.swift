//
//  UserRepositoryInterface.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/18.
//

import Foundation

protocol UserRepositoryInterface {
    func userAuth(_ completion: @escaping (Result<Bool, Error>) -> Void)
}
