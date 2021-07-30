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
            // 検索ページ
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("検索")
                }
                .tag(0)

            // メニューページ
            MenuView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("メニュー")
                }
                .tag(1)
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
