//
//  MenuViewModel.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/27.
//

import Foundation
import MessageUI
import StoreKit

class MenuViewModel {
    func askForReview() {
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            SKStoreReviewController.requestReview(in: scene)
        }
    }

    func shareOnTwitter() {
        let message = "飲食店をクイック検索！ \n 『食いっくグルメ』をダウンロードしよう。"
        guard let encodedMessage = message.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }

        guard let tweetURL = URL(string: "https://twitter.com/intent/tweet?text=\(encodedMessage)") else {
            return
        }
        UIApplication.shared.open(tweetURL, options: [:], completionHandler: nil)
    }

    @discardableResult
    func openDeveloperTwitter(url: String) -> URL? {
        guard let url = URL(string: url) else {
            return nil
        }

        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
            return url
        } else {
            return nil
        }
    }
}
