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
                        print("駅、エリア: \($keywordText.wrappedValue)")
                        print("ジャンル: \($genreText.wrappedValue)")
                    }
                    Spacer()
                }
            }
            .navigationTitle("さくっとグルメ")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        InputView()
    }
}
