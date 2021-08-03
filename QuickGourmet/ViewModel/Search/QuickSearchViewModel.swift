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
    var latitude: Double = 0.0
    var longitude: Double = 0.0

    // 自宅の緯度経度
    // lat 35.6465248372216
    // lng 139.62978627930158

    var requestString: String {
        "https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=\(APIKEY)&lat=\(latitude)&lng=\(longitude)&range=3&genre=\("G001")&count=100&format=json"
    }

    func callShopSearchFetcher() {
        print("requestString: \(requestString)")

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
