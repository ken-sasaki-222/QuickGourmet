//
//  ContentView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/08.
//

import SwiftUI

struct SearchView: View {
    @State var keywordText = ""
    @State var genreText = ""
    @State var selectGenre = 0
    @State var isTapActive = false
    @State var searchVM = SearchViewModel()

    var genreNames = ["居酒屋", "ダイニングバー・バル", "創作料理", "和食", "洋食", "イタリアン・フレンチ", "中華", "焼肉・ホルモン", "アジア・エスニック料理", "各国料理", "カラオケ・パーティ", "バー・カクテル", "ラーメン", "カフェ・スイーツ", "その他グルメ", "お好み焼き・もんじゃ", "韓国料理"]

    // architectureTODO: Viewで管理するのは設計的に違う気がするので後々対応
    // hotpepper gourmet search API
    var requestString: String {
        "https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=\(APIKEY)&keyword=\(keywordText)&genre=\(convertGenreCode(selectCode: selectGenre))&count=10&format=json"
    }

    // Picker選択内容に合わせて公式ジャンルコードを返す
    enum GenreCode: Int {
        case izakaya = 0
        case dainingubar = 1
        case sousakuryouri = 2
        case wasyoku = 3
        case yousyoku = 4
        case italian = 5
        case tyuuka = 6
        case yakiniku = 7
        case aziaryouri = 8
        case kakukokuryouri = 9
        case karaoke = 10
        case kakuteru = 11
        case ramen = 12
        case cafe = 13
        case other = 14
        case okonomiyaki = 15
        case corearyouri = 16

        var genreCode: String {
            switch self {
            case .izakaya:
                return "G001"
            case .dainingubar:
                return "G002"
            case .sousakuryouri:
                return "G003"
            case .wasyoku:
                return "G004"
            case .yousyoku:
                return "G005"
            case .italian:
                return "G006"
            case .tyuuka:
                return "G007"
            case .yakiniku:
                return "G008"
            case .aziaryouri:
                return "G009"
            case .kakukokuryouri:
                return "G010"
            case .karaoke:
                return "G011"
            case .kakuteru:
                return "G012"
            case .ramen:
                return "G013"
            case .cafe:
                return "G014"
            case .other:
                return "G015"
            case .okonomiyaki:
                return "G016"
            case .corearyouri:
                return "G017"
            }
        }
    }

    var body: some View {
        NavigationView {
            ZStack(alignment: .center) {
                Form {
                    Section(header: Text("必須")) {
                        TextField("駅、エリアを入力", text: $keywordText)
                    }
                    Section(header: Text("必須")) {
                        Picker(selection: $selectGenre, label: Text("ジャンルを選択")) {
                            ForEach(0 ..< genreNames.count) { index in
                                Text(genreNames[index])
                            }
                            .foregroundColor(.black)
                        }
                    }
                }
                .navigationTitle("条件検索")
                // NavigationLink(destination: SearchListView(searchVM: searchVM), isActive: $isTapActive) {}
                SearchButtonView(text: "条件検索") {
                    communicateHotPepperAPI()
                    self.isTapActive = true
                }
            }
        }
    }

    // architectureTODO: enumも含めてconvertGenreCodeはViewで管理するのは設計的に違う気がするので後々対応
    // Pickerのselectionを取得してHotPepperAPIで使えるString型に変換
    func convertGenreCode(selectCode: Int) -> String {
        guard let code = GenreCode(rawValue: selectCode)?.genreCode else {
            return ""
        }
        print("code: \(code)")
        return code
    }

    func communicateHotPepperAPI() {
        print("requestString: \(requestString)")
        searchVM.urlString = requestString
        searchVM.callShopSearchFetcher()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
