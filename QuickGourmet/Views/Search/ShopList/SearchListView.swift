//
//  SearchListView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/13.
//

import SwiftUI

struct SearchListView: View {
    // インターフェース定義用Mock
    // let shopData: [Response] = mockShopesDate
    // @ObservedObject var shopSearchFetcher = ShopSearchFetcher()

    // @ObservedObject var searchVM: SearchViewModel
    @ObservedObject var quickSearchVM: QuickSearchViewModel

    var body: some View {
        if quickSearchVM.shopData.count != 0 {
            List(quickSearchVM.shopData) { shop in
                NavigationLink(destination: ShopDetailView(shopData: shop)) {
                    ShopRowView(shopData: shop)
                }
            }
            .listStyle(PlainListStyle())
            .onAppear {
                UITableView.appearance().backgroundColor = UIColor(ColorManager.white_black)
            }
        } else {
            ZStack {
                ColorManager.gray.opacity(0.5)
                    .frame(width: 320, height: 45, alignment: .center)
                    .cornerRadius(10)
                Text("検索結果に該当するお店がありません")
                    .font(.custom(FontManager.Mplus.regular, size: 18))
                NendBannerView()
            }
        }
    }
}

struct SearchListView_Previews: PreviewProvider {
    var searchVM: SearchViewModel
    static var previews: some View {
        SearchListView(quickSearchVM: QuickSearchViewModel())
    }
}
