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
    @ObservedObject var searchVM = SearchViewModel()
    
    var genreNames = ["居酒屋", "ダイニングバー・バル", "創作料理", "和食", "洋食", "イタリアン・フレンチ", "中華", "焼肉・ホルモン", "アジア・エスニック料理", "各国料理", "カラオケ・パーティ", "バー・カクテル", "ラーメン", "カフェ・スイーツ", "その他グルメ", "お好み焼き・もんじゃ", "韓国料理",]
    
    // hotpepper gourmet search API
    var requestString: String {
        get {
            return "https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=\(API_KEY)&keyword=\(keywordText)&genre=\(convertGenreCode(selectCode: selectGenre))&count=10&format=json"
        }
    }
    
    // Picker選択内容に合わせて公式ジャンルコードを返す
    enum GenreCode: Int {
        case 居酒屋 = 0
        case ダイニングバー・バル = 1
        case 創作料理 = 2
        case 和食 = 3
        case 洋食 = 4
        case イタリアン・フレンチ = 5
        case 中華 = 6
        case 焼肉・ホルモン = 7
        case アジア・エスニック料理 = 8
        case 各国料理 = 9
        case カラオケ・パーティ = 10
        case バー・カクテル = 11
        case ラーメン = 12
        case カフェ・スイーツ = 13
        case その他グルメ = 14
        case お好み焼き・もんじゃ = 15
        case 韓国料理 = 16
        
        var genreCode: String {
            switch self {
            case .居酒屋:
                return "G001"
            case .ダイニングバー・バル:
                return "G002"
            case .創作料理:
                return "G003"
            case .和食:
                return "G004"
            case .洋食:
                return "G005"
            case .イタリアン・フレンチ:
                return "G006"
            case .中華:
                return "G007"
            case .焼肉・ホルモン:
                return "G008"
            case .アジア・エスニック料理:
                return "G009"
            case .各国料理:
                return "G010"
            case .カラオケ・パーティ:
                return "G011"
            case .バー・カクテル:
                return "G012"
            case .ラーメン:
                return "G013"
            case .カフェ・スイーツ:
                return "G014"
            case .その他グルメ:
                return "G015"
            case .お好み焼き・もんじゃ:
                return "G016"
            case .韓国料理:
                return "G017"
            default:
                return ""
            }
        }
    }
        
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("必須")) {
                    TextField("駅、エリアを入力", text: $keywordText)
                }
                Section(header: Text("必須")) {
                    Picker(selection: $selectGenre, label: Text("ジャンルを選択")) {
                        ForEach(0..<genreNames.count) { index in
                            Text(genreNames[index])
                        }
                        .foregroundColor(.black)
                    }
                }
                HStack {
                    Spacer()
                      NavigationLink("検索", destination: SearchListView())
                    Spacer()
                }
            }
            .navigationTitle("食いっくグルメ")
        }
    }
    
    // Pickerのselectionを取得してHotPepperAPIで使えるString型に変換
    func convertGenreCode(selectCode: Int) -> String {
        guard let code = GenreCode(rawValue: selectCode)?.genreCode else {
            return ""
        }
        print("code: \(code)")
        return code
    }
    
    // 検索情報を投げる
    func communicationAPI() {
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
