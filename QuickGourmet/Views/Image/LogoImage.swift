//
//  LogoImage.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/27.
//

import SwiftUI

struct LogoImage: View {
    @ObservedObject private var imageDownloader = ImageDownloader()
    let urlString: String
    
    init(urlString: String) {
        self.urlString = urlString
        self.imageDownloader.downloadImage(url: self.urlString)
    }
    
    var body: some View {
        if let imageData = self.imageDownloader.downloadData {
            guard let img = UIImage(data: imageData) else {
                return VStack {
                    Image(uiImage: UIImage(systemName: "icloud.and.arrow.down")!)
                        .resizable()
                        .frame(width: 35, height: 32, alignment: .center)
                }
            }
            return VStack {
                Image(uiImage: img)
                    .resizable()
                    .frame(width: 80, height: 80, alignment: .center)
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


struct LogoImage_Previews: PreviewProvider {
    static var previews: some View {
        LogoImage(urlString: "https://imgfp.hotp.jp/IMGH/54/14/P037425414/P037425414_168.jpg")
    }
}
