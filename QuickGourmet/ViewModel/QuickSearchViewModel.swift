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

    func getShopData() async {
        print("requestString:", requestString)
        let requestString = requestString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) ?? ""

        do {
            let response = try await shopSearchRepository.fetchShopDate(requestString: requestString)
            // refactorTODO: 新しい書き方にしたい
            DispatchQueue.main.async {
                self.shopData = response
            }
        } catch {
            self.error = error
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

    func openCurrentLocationView() -> Bool {
        let isFirstLaunch = userRepository.launchCount == 1
        let locationSaved = userRepository.locationSaved

        if isFirstLaunch || !locationSaved {
            return true
        } else {
            return false
        }
    }
}
