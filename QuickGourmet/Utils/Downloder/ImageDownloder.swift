//
//  ImageDownloder.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/14.
//

import Foundation

class ImageDownloader: ObservableObject {
    // 監視対象
    // このプロパティに変更があった場合にイベントを通知
    @Published var downloadData: Data?

    // 引数を非同期で監視対象に代入
    func downloadImage(url: String) {
        guard let imageURL = URL(string: url) else {
            return
        }

        DispatchQueue.global().async {
            let data = try? Data(contentsOf: imageURL)
            DispatchQueue.main.async {
                self.downloadData = data
            }
        }
    }
}
