//
//  TabBarView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/08.
//

import SwiftUI

struct TabBarView: View {
    @State private var section = 0
    @State private var isShowsIndicator = false
    private let locatePermissionVM = LocatePermissionViewModel()
    private let appTrackingTransparencyVM = AppTrackingTransparencyViewModel()

    init() {
        setUpTabBar()
    }

    var body: some View {
        ZStack {
            TabView(selection: $section) {
                QuickSearchView()
                    .tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("探す")
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
                isShowsIndicator = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    setUpRootView()
                }
            }
            if isShowsIndicator {
                ZStack {
                    ColorManager.black.opacity(0.3)
                        .edgesIgnoringSafeArea(.all)
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 140, height: 120, alignment: .center)
                        .foregroundColor(ColorManager.black.opacity(0.7))
                    VStack {
                        ActivityIndicator()
                        Text("Loading...")
                            .foregroundColor(ColorManager.white)
                            .padding(.top, 3)
                    }
                }
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
            isShowsIndicator = false
            RootViewHelper.shared.changeRootView(rootView: .location)
        } else if isLocatePermissionViewEnabled == false && isTrackingPermissionViewEnabled == true {
            isShowsIndicator = false
            RootViewHelper.shared.changeRootView(rootView: .tracking)
        } else if isLocatePermissionViewEnabled == false && isTrackingPermissionViewEnabled == false {
            isShowsIndicator = false
            RootViewHelper.shared.changeRootView(rootView: .home)
        }
    }
}

struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
