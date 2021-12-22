//
//  AppState.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/12/22.
//

import Foundation

class AppState: ObservableObject {
    @Published private(set) var rootView: RootViews = .home
    static let shared = AppState()

    private init() {
        // no action..
    }

    enum RootViews {
        case location
        case home
    }

    func changeRootView(rootView: RootViews) {
        self.rootView = rootView
    }
}
