//
//  MenuView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/08.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        Form {
            Section(header: Text("このアプリについて")) {
                HStack {
                    Image("mail_icon")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(10)
                    Button ("ご意見・ご要望") {
                        print("お問い合わせ")
                    }
                    .foregroundColor(.black)
                }
                
                HStack {
                    Image("share_icon")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(10)
                    Button("シェア") {
                        
                    }
                    .foregroundColor(.black)
                }
            }
            
            Section(header: Text("開発者")) {
                
                HStack {
                    Image("twitter_icon")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(10)
                    Button("Twitter") {
                        
                    }
                    .foregroundColor(.black)
                }
                
                HStack {
                    Image("github_icon")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(10)
                    Button("GitHub") {
                        
                    }
                    .foregroundColor(.black)
                    
                }
                
                HStack {
                    Image("qiita_icon")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(10)
                    Button("Qiita") {
                        
                    }
                    .foregroundColor(.black)
                }
            }
            
            Section(header: Text("バージョン")) {
                HStack {
                    Image("version_icon")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(10)
                    Button("バージョン  1.0") {
                        
                    }
                    .foregroundColor(.black)
                }
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
