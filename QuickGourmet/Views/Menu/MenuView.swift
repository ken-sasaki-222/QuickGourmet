//
//  MenuView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/08.
//

import SwiftUI
import StoreKit
import MessageUI

struct MenuView: View {
    @State private var isShowMailView = false
    var menuVM = MenuViewModel()
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("このアプリについて")) {
                    HStack {
                        Image("mail_icon")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(10)
                        Button("ご意見・ご要望") {
                            isShowMailView = true
                        }
                        .disabled(!MFMailComposeViewController.canSendMail())
                        .sheet(isPresented: $isShowMailView) {
                            MailView(isShow: $isShowMailView)
                        }
                    }
                    HStack {
                        Image("review_icon")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(10)
                        Button("レビュー") {
                            if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                                SKStoreReviewController.requestReview(in: scene)
                            }
                        }
                    }
                    HStack {
                        Image("share_icon")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(10)
                        Button("シェア") {
                            menuVM.shareOnTwitter()
                        }
                    }
                }
                Section(header: Text("開発者")) {
                    HStack {
                        Image("twitter_icon")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(10)
                        Button("Twitter") {
                            menuVM.goToDeveloperSNSPage(snsString: "twitter")
                        }
                    }
                    HStack {
                        Image("github_icon")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(10)
                        Button("GitHub") {
                            menuVM.goToDeveloperSNSPage(snsString: "gitHub")
                        }
                    }
                    HStack {
                        Image("qiita_icon")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(10)
                        Button("Qiita") {
                            menuVM.goToDeveloperSNSPage(snsString: "qiita")
                        }
                    }
                }
                Section(header: Text("バージョン")) {
                    HStack {
                        Image("version_icon")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(10)
                        Text("バージョン 1.0")
                    }
                }
            }
            .navigationTitle("メニュー")
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
