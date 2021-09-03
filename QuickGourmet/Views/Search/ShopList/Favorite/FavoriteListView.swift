//
//  FavoriteListView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/21.
//

import SwiftUI

struct FavoriteListView: View {
    @ObservedObject var favoriteVM = FavoriteViewModel()

    init() {
        NavigationManager().setNavigation()
    }

    var body: some View {
        NavigationView {
            if favoriteVM.favoriteShopData.count != 0 {
                List(favoriteVM.favoriteShopData) { shopData in
                    NavigationLink(destination: FavoriteShopDetailView(favoriteShopData: shopData)) {
                        FavoriteShopRowView(favoriteShopData: shopData)
                    }
                }
                .onAppear {
                    favoriteVM.getFavoriteShop()
                    switch favoriteVM.recordFavoriteListLaunchCount() {
                    case true:
                        NendInterstitialView().showInterstitiaStillessAD()
                    case false:
                        break
                    }
                }
            } else {
                ZStack {
                    ColorManager.gray.opacity(0.5)
                        .frame(width: 320, height: 45, alignment: .center)
                        .cornerRadius(10)
                    Text("ブックマークされた店舗がありません")
                        .font(.custom(FontManager.Mplus.regular, size: 18))
                    NendBannerView()
                }
                .navigationTitle("お気に入り店舗一覧")
                .navigationBarTitleDisplayMode(.inline)
                .listStyle(PlainListStyle())
            }
        }
        .accentColor(ColorManager.font_white)
        .onAppear {
            favoriteVM.getFavoriteShop()
        }
    }
}

struct FavoriteListView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteListView()
    }
}
