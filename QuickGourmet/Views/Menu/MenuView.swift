//
//  MenuView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/08.
//

import MessageUI
import StoreKit
import SwiftUI

struct MenuView: View {
    @State private var isShowMailView = false
    @State private var isShowsAlert = false
    private let menuVM = HamburgerMenuViewModel()
//    private let userAuthVM = UserAuthViewModel()

    var body: some View {
        Form {
            Section(header: Text("このアプリについて")) {
                HStack {
                    MenuIconView(image: "mail_icon", color: ColorManager.icon_red)
                    Button(action: {
                        isShowMailView = true
                    }) {
                        Text("ご意見・ご要望")
                            .font(.custom(FontManager.Mplus.regular, size: 13))
                            .foregroundColor(ColorManager.font_light_dark)
                    }
                    .disabled(!MFMailComposeViewController.canSendMail())
                    .sheet(isPresented: $isShowMailView) {
                        MailView(isShow: $isShowMailView)
                    }
                }
                HStack {
                    MenuIconView(image: "share_icon", color: ColorManager.icon_gold)
                    Button(action: {
                        menuVM.shareOnTwitter()
                    }) {
                        Text("シェア")
                            .font(.custom(FontManager.Mplus.regular, size: 13))
                            .foregroundColor(ColorManager.font_light_dark)
                    }
                }
            }
            Section(header: Text("開発者")) {
                HStack {
                    MenuIconView(image: "twitter_icon", color: ColorManager.icon_blue)
                    Button(action: {
                        menuVM.goToDeveloperSNSPage(snsString: "twitter")
                    }) {
                        Text("Twitter")
                            .font(.custom(FontManager.Mplus.regular, size: 13))
                            .foregroundColor(ColorManager.font_light_dark)
                    }
                }
                HStack {
                    MenuIconView(image: "github_icon", color: ColorManager.black)
                    Button(action: {
                        menuVM.goToDeveloperSNSPage(snsString: "gitHub")
                    }) {
                        Text("GitHub")
                            .font(.custom(FontManager.Mplus.regular, size: 13))
                            .foregroundColor(ColorManager.font_light_dark)
                    }
                }
                HStack {
                    MenuIconView(image: "qiita_icon", color: ColorManager.icon_green)
                    Button(action: {
                        menuVM.goToDeveloperSNSPage(snsString: "qiita")
                    }) {
                        Text("Qiita")
                            .font(.custom(FontManager.Mplus.regular, size: 13))
                            .foregroundColor(ColorManager.font_light_dark)
                    }
                }
            }
            Section(header: Text("バージョン")) {
                HStack {
                    MenuIconView(image: "version_icon", color: ColorManager.icon_purple)
                    Text("バージョン 1.0.2")
                        .font(.custom(FontManager.Mplus.regular, size: 13))
                        .foregroundColor(ColorManager.font_light_dark)
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
