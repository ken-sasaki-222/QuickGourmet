//
//  NendBannerView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/14.
//

import Foundation
import SwiftUI

final class NendBannerView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> NendBannerViewController {
        let bannerVC = NendBannerViewController()
        return bannerVC
    }

    func updateUIViewController(_ uiViewController: NendBannerViewController, context: Context) {}
}
