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

    init() {
        setTabBar()
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
                switch locatePermissionVM.openLocatePermissionViewEnabled {
                case true:
                    RootViewHelper.shared.changeRootView(rootView: .location)
                case false:
                    return
                }
            }
        }
    }

    private func setTabBar() {
        UITabBar.appearance().unselectedItemTintColor = UIColor(ColorManager.gray)
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
