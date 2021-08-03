//
//  QuickSearchViewModel.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/03.
//

import Foundation
import SwiftUI

class QuickSearchViewModel {
    func goToLocationSetting() {
        if let url = URL(string: "app-settings:root=General&path=com.ken.QuickGourmet") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
