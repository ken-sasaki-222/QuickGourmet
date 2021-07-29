//
//  WebView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/23.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    typealias UIViewControllerType = SFSafariViewController
    
    var url: URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SafariView>) {
        
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        SafariView(url: URL(string: mockShopesData[0].results.shop[0].urls.pc)!)
    }
}
