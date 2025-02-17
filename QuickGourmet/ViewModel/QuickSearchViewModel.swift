//
//  QuickSearchViewModel.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/03.
//

import Foundation

class QuickSearchViewModel: NSObject, ObservableObject {
    @Published var shopData: [Shop] = []
    @Published var error: Error?
    private var userRepository: UserRepositoryInterface
    private let genreTypeRepository: GenreTypeRepositoryInterface
    private var shopSearchRepository: ShopRepositoryInterface
    private let pickerSelectTypeRepository: PickerSelectTypeRepositoryInterface
    private let reviewRepository: ReviewRepositoryInterface
    private var reviewed = false
    var genreIndex: Int = 0
    var pickerSelection: Int = 0

    init(userRepository: UserRepositoryInterface, genreTypeRepository: GenreTypeRepositoryInterface, shopSearchRepository: ShopRepositoryInterface, pickerSelectTypeRepository: PickerSelectTypeRepositoryInterface, reviewRepository: ReviewRepositoryInterface) {
        self.userRepository = userRepository
        self.genreTypeRepository = genreTypeRepository
        self.shopSearchRepository = shopSearchRepository
        self.pickerSelectTypeRepository = pickerSelectTypeRepository
        self.reviewRepository = reviewRepository
        super.init()
    }

    override convenience init() {
        self.init(
            userRepository: RepositoryLocator.getUserRepository(),
            genreTypeRepository: RepositoryLocator.getGenreTypeRepository(),
            shopSearchRepository: RepositoryLocator.getShopSearchRepository(),
            pickerSelectTypeRepository: RepositoryLocator.getPickerSelectTypeRepository(),
            reviewRepository: RepositoryLocator.getReviewRepository()
        )
    }

    private var latitude: Double {
        userRepository.latitude
    }

    private var longitude: Double {
        userRepository.longitude
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

    private var hotpepperKey: String? {
        do {
            guard let key = try LoadSettingsHelper.getHotpepperKey() else {
                return nil
            }

            return key
        } catch {
            print("Error get hotpepper key.")
            print("Error localize message.", error.localizedDescription)
            return nil
        }
    }

    private func getRequestString() -> String? {
        guard let range = range, let genre = genre, let key = hotpepperKey else {
            return nil
        }

        let params = "?key=\(key)&lat=\(latitude)&lng=\(longitude)&range=\(range)&genre=\(genre)&count=100&format=json"
        let requestString = "https://webservice.recruit.co.jp/hotpepper/gourmet/v1/" + params

        return requestString
    }

    func getShopData() async {
        guard let requestString = getRequestString() else {
            return
        }
        print(requestString as Any)

        let request = requestString.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) ?? ""

        do {
            let response = try await shopSearchRepository.fetchShopDate(request: request)
            // refactorTODO: 新しい書き方にしたい
            DispatchQueue.main.async {
                self.shopData = response
            }
        } catch {
            DispatchQueue.main.async {
                self.error = error
            }
        }
    }

    func askForReview() {
        if reviewed == true {
            return
        }
        if userRepository.launchCount % 5 == 0 {
            reviewRepository.askForReview()
            reviewed = true
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
