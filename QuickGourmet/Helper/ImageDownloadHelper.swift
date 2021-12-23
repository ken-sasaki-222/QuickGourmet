//
//  ImageDownloadHelper.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/12/23.
//

import Foundation

class ImageDownloadHelper: ObservableObject {
    @Published var downloadData: Data?

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
