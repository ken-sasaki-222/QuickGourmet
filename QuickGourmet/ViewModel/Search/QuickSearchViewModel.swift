//
//  QuickSearchViewModel.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/03.
//

import Foundation
import SwiftUI

class QuickSearchViewModel: ObservableObject {
    @Published var shopSearchFetcher = ShopSearchFetcher()
    @Published var shopData: [Shop] = []
    var genreIndex: Int = 0
    var pickerSelection: Int = 0
    var latitude: Double = 0.0
    var longitude: Double = 0.0

    enum GenreCode: Int {
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

    enum PickerSelectType: Int {
        case threeMinutesWalk = 0
        case sevenMinutesWalk = 1
        case thirteenMinuteWalk = 2
        case twentyMinuteWalk = 3
        case thirtyMinuteWalk = 4

        var pickerSelectIndex: Int {
            switch self {
            case .threeMinutesWalk:
                return 1
            case .sevenMinutesWalk:
                return 2
            case .thirteenMinuteWalk:
                return 3
            case .twentyMinuteWalk:
                return 4
            case .thirtyMinuteWalk:
                return 5
            }
        }
    }

    var range: Int {
        guard let range = PickerSelectType(rawValue: pickerSelection)?.pickerSelectIndex else {
            return 0
        }
        return range
    }

    var requestString: String {
        "https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=\(APIKEY)&lat=\(latitude)&lng=\(longitude)&range=\(range)3&genre=\(convertGenreCode(selectIndex: genreIndex))&count=100&format=json"
    }

    func convertGenreCode(selectIndex: Int) -> String {
        guard let code = GenreCode(rawValue: selectIndex)?.genreCode else {
            return ""
        }
        print("code: \(code)")
        return code
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
}
