//
//  UserRepositoryInterface.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/18.
//

import Foundation

protocol UserRepositoryInterface {
    var latitude: Double { get set }
    var longitude: Double { get set }
    var locatePermission: Bool { get set }
    var trackingPermission: Bool { get set }
    var launchCount: Int { get set }
    var searchListLaunchCount: Int { get set }
    var shopDetailLaunchCount: Int { get set }
    var favoriteListLaunchCount: Int { get set }
    var favoriteShopDetailLaunchCount: Int { get set }
    var deviceId: String { get set }
}
