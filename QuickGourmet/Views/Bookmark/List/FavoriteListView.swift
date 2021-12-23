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
                        FavoriteListRowView(favoriteShopData: shopData)
                    }
                }
                .navigationTitle("ブックマーク一覧")
                .navigationBarTitleDisplayMode(.inline)
                .listStyle(PlainListStyle())
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
                    Text("ブックマークされたお店がありません")
                        .font(.custom(FontManager.Mplus.regular, size: 18))
                }
                .navigationTitle("ブックマーク一覧")
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
