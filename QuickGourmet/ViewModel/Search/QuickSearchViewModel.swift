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
    @Published var shopSearchFetcher = ShopSearchFetcher()
    @Published var shopData: [Shop] = []
    private let genreTypeRepository: GenreTypeRepositoryInterface
    private let userDefaultsDataStore = UserDefaultsDataStore()
    private var reviewed = false
    var genreIndex: Int = 0
    var pickerSelection: Int = 0
    var latitude: Double = 0.0
    var longitude: Double = 0.0

    init(genreTypeRepository: GenreTypeRepositoryInterface) {
        self.genreTypeRepository = genreTypeRepository
        super.init()
    }

    override convenience init() {
        self.init(genreTypeRepository: RepositoryLocator.getGenreTypeRepository())
    }

    private enum PickerSelectionType: Int {
        case fourMinutesWalk = 0
        case sevenMinutesWalk = 1
        case thirteenMinuteWalk = 2
        case twentyFiveMinutes = 3
        case thirtyEightMinuteWalk = 4

        var rangeCode: Int {
            switch self {
            case .fourMinutesWalk:
                return 1
            case .sevenMinutesWalk:
                return 2
            case .thirteenMinuteWalk:
                return 3
            case .twentyFiveMinutes:
                return 4
            case .thirtyEightMinuteWalk:
                return 5
            }
        }
    }

    private var range: Int {
        guard let rangeCode = PickerSelectionType(rawValue: pickerSelection)?.rangeCode else {
            return 5
        }
        return rangeCode
    }

    private var genre: String {
        guard let genreType = GenreType(rawValue: genreIndex) else {
            return ""
        }
        let genre = genreTypeRepository.getGenreCode(genre: genreType)
        return genre
    }

    // HotPepper API.
    private var requestString: String {
        "https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=\(APIKEY)&lat=\(latitude)&lng=\(longitude)&range=\(range)&genre=\(genre)&count=100&format=json"
    }

    func callShopSearchFetcher() {
        print("requestString:", requestString)
        guard let encodeString = requestString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) else {
            return
        }

        shopSearchFetcher.requestString = encodeString
        shopSearchFetcher.fetchShopData { shopes in
            self.shopData = shopes
            print("shopData", self.shopData)
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
        if userDefaultsDataStore.launchCount % 7 == 0 {
            if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                SKStoreReviewController.requestReview(in: scene)
                reviewed = true
            }
        }
    }

    func recordSearchListLaunchCount() -> Bool {
        userDefaultsDataStore.searchListLaunchCount = userDefaultsDataStore.searchListLaunchCount
        if userDefaultsDataStore.searchListLaunchCount % 10 == 0 {
            return true
        } else {
            return false
        }
    }

    func recordShopDetailLaunchCount() -> Bool {
        userDefaultsDataStore.shopDetailLaunchCount = userDefaultsDataStore.shopDetailLaunchCount
        if userDefaultsDataStore.shopDetailLaunchCount % 6 == 0 {
            return true
        } else {
            return false
        }
    }
}
