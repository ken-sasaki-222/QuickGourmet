//
//  ReviewRepository.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/12/30.
//

import Foundation
import StoreKit

class ReviewRepository: ReviewRepositoryInterface {
    func askForReview() {
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            SKStoreReviewController.requestReview(in: scene)
        }
    }
}
