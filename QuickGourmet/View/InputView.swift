//
//  ContentView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/08.
//

import SwiftUI

struct InputView: View {
    @State var keywordText = ""
    @State var genreText = ""
    
    var requestURL: String {
        get {
            return "https://webservice.recruit.co.jp/hotpepper/gourmet/v1/?key=\(API_KEY)&keyword=\($keywordText.wrappedValue)&genre=\("G002")&count=10&format=json"
        }
    }
        
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("必須")) {
                    TextField("駅、エリアを入力", text: $keywordText)
                }
                
                Section(header: Text("必須")) {
                    TextField("料理ジャンルを入力", text: $genreText)
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
    
    // API通信
    func communicationAPI() {
        print("検索URL: \(requestURL)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        InputView()
    }
}
