//
//  URLImage.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/14.
//

import SwiftUI

struct URLImage: View {
    // ObservableObjectに準拠したクラスのインスタンス
    // これで@Publishedなプロパティを監視できる（この場合downloadData）
    @ObservedObject private var imageDownloader = ImageDownloader()

    let urlString: String

    init(urlString: String) {
        self.urlString = urlString
        imageDownloader.downloadImage(url: self.urlString)
    }

    var body: some View {
        // downloadDataに値が無ければSF Symbolを返す
        if let imageData = self.imageDownloader.downloadData {
            // force unwrap! 使いたくないのでguard
            guard let img = UIImage(data: imageData) else {
                return VStack {
                    Image("not_image")
                        .resizable()
                        .frame(width: 120, height: 120, alignment: .center)
                }
            }
            // Viewを返す
            return VStack {
                Image(uiImage: img)
                    .resizable()
                    .frame(width: 120, height: 120, alignment: .center)
            }
        } else {
            return VStack {
                Image("not_image")
                    .resizable()
                    .frame(width: 120, height: 120, alignment: .center)
            }
        }
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(urlString: "https://imgfp.hotp.jp/IMGH/54/14/P037425414/P037425414_168.jpg")
    }
}
