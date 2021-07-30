//
//  MenuViewModel.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/27.
//

import Foundation
import MessageUI
import SwiftUI

class MenuViewModel {
    enum DevelopperUrlType: String {
        case twitter = "https://twitter.com/ken_sasaki2"
        case gitHub = "https://github.com/ken-sasaki-222"
        case qiita = "https://qiita.com/nkekisasa222"
    }

    func shareOnTwitter() {
        let message = "飲食店をクイック検索！ \n 『食いっくグルメ』をダウンロードしよう。"

        // URLクエリ内で使用できる文字列に変換
        guard let encodedMessage = message.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else {
            return
        }

        guard let tweetURL = URL(string: "https://twitter.com/intent/tweet?text=\(encodedMessage)") else {
            return
        }

        UIApplication.shared.open(tweetURL, options: [:], completionHandler: nil)
    }

    func goToDeveloperSNSPage(snsString: String) {
        var snsUrlString = String()

        switch snsString {
        case "twitter":
            snsUrlString = DevelopperUrlType.twitter.rawValue
        case "gitHub":
            snsUrlString = DevelopperUrlType.gitHub.rawValue
        case "qiita":
            snsUrlString = DevelopperUrlType.qiita.rawValue
        default:
            break
        }

        guard let snsUrl = URL(string: snsUrlString) else {
            return
        }

        if UIApplication.shared.canOpenURL(snsUrl) {
            UIApplication.shared.open(snsUrl, options: [:], completionHandler: nil)
        }
    }
}
