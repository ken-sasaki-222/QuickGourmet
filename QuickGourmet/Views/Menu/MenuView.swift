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
    private let locatePermissionVM = LocatePermissionViewModel()

    init() {
        NavigationManager().setNavigation()
    }

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("このアプリについて")) {
                    HStack {
                        MenuIconView(image: "mail_icon", color: ColorManager.icon_purple)
                        Button(action: {
                            isShowMailView = true
                        }) {
                            Text("ご意見・ご要望")
                                .font(.custom(FontManager.Mplus.regular, size: 16))
                                .foregroundColor(ColorManager.font_light_dark)
                        }
                        .disabled(!MFMailComposeViewController.canSendMail())
                        .sheet(isPresented: $isShowMailView) {
                            MailView(isShow: $isShowMailView)
                        }
                    }
                    HStack {
                        MenuIconView(image: "share_icon", color: ColorManager.icon_orange)
                        Button(action: {
                            menuVM.shareOnTwitter()
                        }) {
                            Text("シェア")
                                .font(.custom(FontManager.Mplus.regular, size: 16))
                                .foregroundColor(ColorManager.font_light_dark)
                        }
                    }
                }
                Section(header: Text("設定")) {
                    HStack {
                        MenuIconView(image: "pin_icon", color: ColorManager.icon_green)
                        Button(action: {
                            locatePermissionVM.goToLocateSetting()
                        }) {
                            Text("位置情報設定")
                                .font(.custom(FontManager.Mplus.regular, size: 16))
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
                                .font(.custom(FontManager.Mplus.regular, size: 16))
                                .foregroundColor(ColorManager.font_light_dark)
                        }
                    }
                }
                Section(header: Text("バージョン")) {
                    HStack {
                        MenuIconView(image: "version_icon", color: ColorManager.mainColor)
                        Text("バージョン 1.0.3")
                            .font(.custom(FontManager.Mplus.regular, size: 16))
                            .foregroundColor(ColorManager.font_light_dark)
                    }
                }
            }
            .navigationTitle("メニュー")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
