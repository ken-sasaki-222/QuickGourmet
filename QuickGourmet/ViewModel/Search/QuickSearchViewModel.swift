//
//  QuickSearchViewModel.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/03.
//

import AdSupport
import AppTrackingTransparency
import Foundation
import SwiftUI

class QuickSearchViewModel: ObservableObject {
    @Published var shopSearchFetcher = ShopSearchFetcher()
    @Published var shopData: [Shop] = []
    private let userDefaultsDataStore = UserDefaultsDataStore()
    var genreIndex: Int = 0
    var pickerSelection: Int = 0
    var latitude: Double = 0.0
    var longitude: Double = 0.0

    private enum GenreType: Int {
        case izakaya = 0
        case dainingubar = 1
        case sousakuryouri = 2
        case wasyoku = 3
        case yousyoku = 4
        case italian = 5
        case tyuuka = 6
        case yakiniku = 7
        case aziaryouri = 8
        case kakukokuryouri = 9
        case karaoke = 10
        case kakuteru = 11
        case ramen = 12
        case cafe = 13
        case other = 14
        case okonomiyaki = 15
        case corearyouri = 16

        var genreCode: String {
            switch self {
            case .izakaya:
                return "G001"
            case .dainingubar:
                return "G002"
            case .sousakuryouri:
                return "G003"
            case .wasyoku:
                return "G004"
            case .yousyoku:
                return "G005"
            case .italian:
                return "G006"
            case .tyuuka:
                return "G007"
            case .yakiniku:
                return "G008"
            case .aziaryouri:
                return "G009"
            case .kakukokuryouri:
                return "G010"
            case .karaoke:
                return "G011"
            case .kakuteru:
                return "G012"
            case .ramen:
                return "G013"
            case .cafe:
                return "G014"
            case .other:
                return "G015"
            case .okonomiyaki:
                return "G016"
            case .corearyouri:
                return "G017"
            }
        }
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
        guard let genreCode = GenreType(rawValue: genreIndex)?.genreCode else {
            return ""
        }
        return genreCode
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

    func recordShopDetailLaunchCount() -> Bool {
        userDefaultsDataStore.shopDetailLaunchCount = userDefaultsDataStore.shopDetailLaunchCount
        if userDefaultsDataStore.shopDetailLaunchCount % 5 == 0 {
            return true
        } else {
            return false
        }
    }

    func requestIDFA() {
        ATTrackingManager.requestTrackingAuthorization(completionHandler: { _ in
            // Tracking authorization completed. Start loading ads here.
            // loadAd()
        })
    }
}
