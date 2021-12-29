//
//  TabBarView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/08.
//

import SwiftUI

struct TabBarView: View {
    @State private var section = 0
    private let locatePermissionVM = LocatePermissionViewModel()
    private let appTrackingTransparencyVM = AppTrackingTransparencyViewModel()

    init() {
        setUpTabBar()
    }

    var body: some View {
        TabView(selection: $section) {
            QuickSearchView()
                .tabItem {
                    Image(systemName: "house")
                    Text("ホーム")
                }
                .tag(0)
            FavoriteListView()
                .tabItem {
                    Image(systemName: "bookmark")
                    Text("ブックマーク")
                }
                .tag(1)
            MenuView()
                .tabItem {
                    Image(systemName: "menucard")
                    Text("メニュー")
                }
                .tag(2)
        }
        .accentColor(ColorManager.mainColor)
        .onAppear {
            DispatchQueue.main.async {
                setUpRootView()
            }
        }
    }

    private func setUpTabBar() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(ColorManager.gray)
    }

    private func setUpRootView() {
        let isLocatePermissionViewEnabled = locatePermissionVM.openLocatePermissionViewEnabled
        let isTrackingPermissionViewEnabled = appTrackingTransparencyVM.openTrackingPermissionViewEnabled

        if isLocatePermissionViewEnabled {
            RootViewHelper.shared.changeRootView(rootView: .location)
        } else if isLocatePermissionViewEnabled == false && isTrackingPermissionViewEnabled == true {
            RootViewHelper.shared.changeRootView(rootView: .tracking)
        } else if isLocatePermissionViewEnabled == false && isTrackingPermissionViewEnabled == false {
            RootViewHelper.shared.changeRootView(rootView: .home)
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
