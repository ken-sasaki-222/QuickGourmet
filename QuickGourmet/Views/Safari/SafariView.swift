//
//  WebView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/23.
//

import SafariServices
import SwiftUI

struct SafariView: UIViewControllerRepresentable {
    typealias UIViewControllerType = SFSafariViewController

    var url: URL

    func makeUIViewController(context _: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        SFSafariViewController(url: url)
    }

    func updateUIViewController(_: SFSafariViewController, context _: UIViewControllerRepresentableContext<SafariView>) {}
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        SafariView(url: URL(string: mockShopesData[0].results.shop[0].urls.pc)!)
    }
}
