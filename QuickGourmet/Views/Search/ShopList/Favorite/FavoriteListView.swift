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
            if favoriteVM.favoriteShopData.count != 0 {
                List(favoriteVM.favoriteShopData) { shopData in
                    NavigationLink(destination: FavoriteShopDetailView(favoriteShopData: shopData)) {
                        FavoriteShopRowView(favoriteShopData: shopData)
                    }
                }
            } else {
                ZStack {
                    Color.gray.opacity(0.5)
                        .frame(width: 300, height: 45, alignment: .center)
                        .cornerRadius(10)
                    Text("お気に入り店舗を登録してください")
                        .font(.headline)
                        .fontWeight(.medium)
                }
                .navigationTitle("お気に入り店舗一覧")
                .navigationBarTitleDisplayMode(.inline)
                .listStyle(PlainListStyle())
            }
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
