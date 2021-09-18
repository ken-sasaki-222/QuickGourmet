//
//  UserRepositoryInterface.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/18.
//

import Foundation

protocol UserRepositoryInterface {
    func login(_ completion: @escaping (Result<Bool, Error>) -> Void)
    func logout(_ completion: @escaping (Result<Bool, Error>) -> Void)
    var latitude: Double { get set }
    var longitude: Double { get set }
}
