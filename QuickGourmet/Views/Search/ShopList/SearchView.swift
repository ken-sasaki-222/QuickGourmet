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
    
    let shopData: [Shop] = mockShopesData
    
    var genreNames = ["居酒屋", "ダイニングバー・バル", "創作料理", "和食", "洋食", "イタリアン・フレンチ", "中華", "焼肉・ホルモン", "アジア・エスニック料理", "各国料理", "カラオケ・パーティ", "バー・カクテル", "ラーメン", "カフェ・スイーツ", "その他グルメ", "お好み焼き・もんじゃ", "韓国料理"]
    
    var requestURL: String {
        get {
            return "https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=\(API_KEY)&keyword=\($keywordText.wrappedValue)&genre=G001&count=10&format=json"
        }
    }
    
    enum GenreCode: String {
        case 居酒屋
        case barbal
        case sousaku
//        case wasyoku = "004"
//        case yousyoku = "005"
//        case itarianfulenti = "006"
//        case tyuuka = "007"
//        case yakiniku = "008"
//        case aziaryouri = "009"
//        case kakokuryouri = "010"
//        case karaokeparty = "011"
//        case kakuteru = "012"
//        case ra_menn = "013"
//        case kafe = "014"
//        case sonota = "015"
//        case okonomiyaku = "016"
//        case korearyori = "017"
        
        var genreCode: String {
            switch self {
            case .居酒屋:
                return "G001"
            case .barbal:
                return "G002"
            case .sousaku:
                return "G003"
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
                    Button("検索") {
                        communicationAPI()
                    }
                    Spacer()
                }
            }
            .navigationTitle("食いっくグルメ")
        }
    }
    
    func kenken(genreName: String) -> String {
        guard let code = GenreCode(rawValue: "居酒屋")?.genreCode else {
            return ""
        }
        return code
    }
    
    // API通信
    func communicationAPI() {
        print("検索URL: \(requestURL)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
