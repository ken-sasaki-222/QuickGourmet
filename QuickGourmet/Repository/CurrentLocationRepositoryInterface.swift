//
//  CurrentLocationRepositoryInterface.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/12/14.
//

import Foundation

protocol CurrentLocationRepositoryInterface {
    func getStatus() -> LocationStatusType
    func callRequestWhenInUse(complication: @escaping (LocationStatusType) -> Void)
    func callStartUpdateLocation()
    var delegate: CurrentLocationRepositoryDelegate? { get set }
}
