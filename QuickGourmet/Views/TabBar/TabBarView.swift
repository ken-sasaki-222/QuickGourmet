//
//  TabBarView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/08.
//

import SwiftUI

struct TabBarView: View {
    @State private var section = 0

    var body: some View {
        TabView(selection: $section) {
            QuickSearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass.circle")
                    Text("クイック検索")
                }
                .tag(0)
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("検索")
                }
                .tag(1) // メニューページ
            HamburgerMenuView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("メニュー")
                }
                .tag(2)
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
