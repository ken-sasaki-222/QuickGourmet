//
//  QuickSearchViewModel.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/03.
//

import AdSupport
import AppTrackingTransparency
import Foundation
import StoreKit
import SwiftUI

class QuickSearchViewModel: NSObject, ObservableObject {
    @Published var shopData: [Shop] = []
    @Published var error: Error?
    private var userRepository: UserRepositoryInterface
    private let genreTypeRepository: GenreTypeRepositoryInterface
    private var shopSearchRepository: ShopRepositoryInterface
    private let pickerSelectTypeRepository: PickerSelectTypeRepositoryInterface
    private var reviewed = false
    var genreIndex: Int = 0
    var pickerSelection: Int = 0

    init(userRepository: UserRepositoryInterface, genreTypeRepository: GenreTypeRepositoryInterface, shopSearchRepository: ShopRepositoryInterface, pickerSelectTypeRepository: PickerSelectTypeRepositoryInterface) {
        self.userRepository = userRepository
        self.genreTypeRepository = genreTypeRepository
        self.shopSearchRepository = shopSearchRepository
        self.pickerSelectTypeRepository = pickerSelectTypeRepository
        super.init()
    }

    override convenience init() {
        self.init(userRepository: RepositoryLocator.getUserRepository(),
                  genreTypeRepository: RepositoryLocator.getGenreTypeRepository(),
                  shopSearchRepository: RepositoryLocator.getShopSearchRepository(),
                  pickerSelectTypeRepository: RepositoryLocator.getPickerSelectTypeRepository())
    }

    private var range: Int? {
        guard let pickerSelectType = PickerSelectType(rawValue: pickerSelection) else {
            return nil
        }
        let rangeCode = pickerSelectTypeRepository.getPickerSelectType(selectType: pickerSelectType)
        return rangeCode
    }

    private var genre: String? {
        guard let genreType = GenreType(rawValue: genreIndex) else {
            return nil
        }
        let genre = genreTypeRepository.getGenreCode(genre: genreType)
        return genre
    }

    private var latitude: Double {
        userRepository.latitude
    }

    private var longitude: Double {
        userRepository.longitude
    }

    // HotPepper API.
    private var requestString: String {
        guard let range = range, let genre = genre else {
            return ""
        }
        return "https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=\(APIKEY)&lat=\(latitude)&lng=\(longitude)&range=\(range)&genre=\(genre)&count=100&format=json"
    }

    func getShopData() {
        print("requestString:", requestString)
        guard let encodeString = requestString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) else {
            return
        }

        shopSearchRepository.fetchShopData(requestString: encodeString) { result in
            switch result {
            case let .success(shopes):
                self.shopData = shopes
                print("shopData", self.shopData)
            case let .failure(error):
                self.error = error
            }
        }
    }

    func goToLocationSetting() {
        if let url = URL(string: "app-settings:root=General&path=com.ken.QuickGourmet") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }

    func requestIDFA() {
        ATTrackingManager.requestTrackingAuthorization(completionHandler: { _ in
            // Tracking authorization completed. Start loading ads here.
            // loadAd()
        })
    }

    func askForReview() {
        if reviewed == true {
            return
        }
        if userRepository.launchCount % 7 == 0 {
            if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                SKStoreReviewController.requestReview(in: scene)
                reviewed = true
            }
        }
    }

    func recordSearchListLaunchCount() -> Bool {
        userRepository.searchListLaunchCount = userRepository.searchListLaunchCount
        if userRepository.searchListLaunchCount % 10 == 0 {
            return true
        } else {
            return false
        }
    }

    func recordShopDetailLaunchCount() -> Bool {
        userRepository.shopDetailLaunchCount = userRepository.shopDetailLaunchCount
        if userRepository.shopDetailLaunchCount % 6 == 0 {
            return true
        } else {
            return false
        }
    }
}
