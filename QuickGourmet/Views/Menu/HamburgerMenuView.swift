//
//  MenuView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/08.
//

import MessageUI
import StoreKit
import SwiftUI

struct HamburgerMenuView: View {
    @State private var isShowMailView = false
    var menuVM = HamburgerMenuViewModel()

    var body: some View {
        Form {
            Section(header: Text("このアプリについて")) {
                HStack {
                    Image("mail_icon")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(5)
                    Button(action: {
                        isShowMailView = true
                    }) {
                        Text("ご意見・ご要望")
                            .font(.caption)
                    }
                    .disabled(!MFMailComposeViewController.canSendMail())
                    .sheet(isPresented: $isShowMailView) {
                        MailView(isShow: $isShowMailView)
                    }
                }
                HStack {
                    Image("review_icon")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(5)
                    Button(action: {
                        menuVM.askForReview()
                    }) {
                        Text("レビュー")
                            .font(.caption)
                    }
                }
                HStack {
                    Image("share_icon")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(5)
                    Button(action: {
                        menuVM.shareOnTwitter()
                    }) {
                        Text("シェア")
                            .font(.caption)
                    }
                }
            }
            Section(header: Text("開発者")) {
                HStack {
                    Image("twitter_icon")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(5)
                    Button(action: {
                        menuVM.goToDeveloperSNSPage(snsString: "twitter")
                    }) {
                        Text("Twitter")
                            .font(.caption)
                    }
                }
                HStack {
                    Image("github_icon")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(5)
                    Button(action: {
                        menuVM.goToDeveloperSNSPage(snsString: "gitHub")
                    }) {
                        Text("GitHub")
                            .font(.caption)
                    }
                }
                HStack {
                    Image("qiita_icon")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(5)
                    Button(action: {
                        menuVM.goToDeveloperSNSPage(snsString: "qiita")
                    }) {
                        Text("Qiita")
                            .font(.caption)
                    }
                }
            }
            Section(header: Text("バージョン")) {
                HStack {
                    Image("version_icon")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(5)
                    Text("バージョン 1.0")
                        .font(.caption)
                }
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        HamburgerMenuView()
    }
}
