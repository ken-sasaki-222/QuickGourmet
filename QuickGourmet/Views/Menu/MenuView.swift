//
//  MenuView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/08.
//

import MessageUI
import StoreKit
import SwiftUI

// Todo
// SwiftFormatにオプションを追加
// SwiftFormatのルールを確認

struct MenuView: View {
    @State private var isShowMailView = false
    var menuVM = MenuViewModel()
    var sample: Bool?
    var sample2: Bool?

    var body: some View {
        List {
            Section(header: Text("このアプリについて")) {
                HStack {
                    Image("mail_icon")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .padding(10)
                    Button("ご意見・ご要望") {
                        if sample == true && sample2 == false {
                            print("--disable unusedArguments")
                        } else {
                            print("")
                        }
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
        .disabled(true)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
