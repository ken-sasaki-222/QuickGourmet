//
//  QuickGourmetApp.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/08.
//

import SwiftUI

@main
struct QuickGourmetApp: App {
    @StateObject private var appState = AppState.shared
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            switch appState.rootView {
            case .location:
                LocatePermissionView()
            case .home:
                TabBarView()
            }
        }
    }
}
