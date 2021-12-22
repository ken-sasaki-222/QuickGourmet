//
//  TabBarView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/08.
//

import SwiftUI

struct TabBarView: View {
    private let quickSearchVM = QuickSearchViewModel()
    @State private var section = 0

    init() {
        setTabBar()
    }

    var body: some View {
        TabView(selection: $section) {
            QuickSearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("食いっく検索")
                }
                .tag(0)
            FavoriteListView()
                .tabItem {
                    Image(systemName: "bookmark")
                    Text("ブックマーク")
                }
                .tag(1)
        }
        .accentColor(ColorManager.mainColor)
        .onAppear {
            DispatchQueue.main.async {
                switch quickSearchVM.openCurrentLocationView() {
                case true:
                    AppState.shared.changeRootView(rootView: .location)
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
