//
//  NavigationManager .swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/09/01.
//

import Foundation
import SwiftUI

struct NavigationManager {
    func setNavigation() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(ColorManager.mainColor)
        appearance.titleTextAttributes = [
            .font: UIFont(name: FontManager.Mplus.medium, size: 20) as Any,
            .foregroundColor: UIColor(ColorManager.font_white)
        ]
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}
