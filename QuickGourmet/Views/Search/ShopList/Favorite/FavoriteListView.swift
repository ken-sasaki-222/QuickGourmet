//
//  FavoriteListView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/21.
//

import SwiftUI

struct FavoriteListView: View {
    @ObservedObject var favoriteVM = FavoriteViewModel()

    var body: some View {
        NavigationView {
            List(favoriteVM.favoriteShopData) { shopData in
                NavigationLink(destination: FavoriteShopDetailView(favoriteShopData: shopData)) {
                    FavoriteShopRowView(favoriteShopData: shopData)
                }
            }
            .navigationTitle("お気に入り店舗一覧")
            .navigationBarTitleDisplayMode(.inline)
        }
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
