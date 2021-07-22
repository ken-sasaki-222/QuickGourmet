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
    
    let url: String

    init(url: String) {
        self.url = url
        self.imageDownloader.downloadImage(url: self.url)
    }

    var body: some View {
        // downloadDataに値が無ければSF Symbolを返す
        if let imageData = self.imageDownloader.downloadData {
            // force unwrap! 使いたくないのでguard
            guard let img = UIImage(data: imageData) else {
                return VStack {
                    Image(uiImage: UIImage(systemName: "icloud.and.arrow.down")!)
                        .resizable()
                        .frame(width: 35, height: 32, alignment: .center)
                }
            }
            // Viewを返す
            return VStack {
                Image(uiImage: img)
                    .resizable()
                    .frame(width: 380, height: 235, alignment: .center)
            }
        } else {
            return VStack {
                Image(uiImage: UIImage(systemName: "icloud.and.arrow.down")!)
                    .resizable()
                    .frame(width: 35, height: 32, alignment: .center)
            }
        }
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: "https://imgfp.hotp.jp/IMGH/54/14/P037425414/P037425414_168.jpg")
    }
}
