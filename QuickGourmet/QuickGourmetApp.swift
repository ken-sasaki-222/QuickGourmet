//
//  QuickGourmetApp.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/08.
//

import SwiftUI

@main
struct QuickGourmetApp: App {
    @StateObject private var rootViewHelper = RootViewHelper.shared
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            switch rootViewHelper.rootView {
            case .location:
                LocatePermissionView()
            case .tracking:
                AppTrackingTransparencyView()
            case .home:
                TabBarView()
            }
        }
    }
}
