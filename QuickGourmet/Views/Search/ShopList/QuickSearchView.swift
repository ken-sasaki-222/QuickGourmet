//
//  QuickSearchView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/02.
//

import SwiftUI

struct QuickSearchView: View {
    @State private var isTapActive = false
    let quickSearchImages = ["food_izakaya", "food_baru", "food_wasyoku", "food_yosyoku", "food_italia", "food_tyuka", "food_yakiniku", "food_asia", "food_kakukoku", "food_karaoke", "food_bar", "food_ramen", "food_cafe", "food_other", "food_okonomiyaki", "food_korea"]

    let quickSearchTextes = ["居酒屋", "ダイニングバー・バル", "創作料理", "和食", "洋食", "イタリアン・フレンチ", "中華", "焼肉・ホルモン", "アジア・エスニック料理", "各国料理", "カラオケ・パーティ", "バー・カクテル", "ラーメン", "カフェ・スイーツ", "その他グルメ", "お好み焼き・もんじゃ", "韓国料理"]

    // searchTODO: 距離指定ではなく徒歩００分で指定させる

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 40) {
                    ForEach(0 ..< quickSearchImages.count) { index in
                        Button(action: {
                            isTapActive = true
                        }) {
                            QuickSearchRowView(imageString: quickSearchImages[index], genreName: quickSearchTextes[index])
                        }
                    }
                }
            }
            .navigationTitle("食いっくグルメ")
        }
    }
}

struct QuickSearchView_Previews: PreviewProvider {
    static var previews: some View {
        QuickSearchView()
    }
}
