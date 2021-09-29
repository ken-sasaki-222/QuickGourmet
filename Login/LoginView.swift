//
//  FirstScreenView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/11.
//

import SwiftUI

struct LoginView: View {
    @State private var isTapActived = false
    @State private var isShowsAlert = false
    @State private var isShowsIndicator = false
    @State private var isShowsRules = false
    @State private var anonymity = ""
    private let userAuthVM = UserAuthViewModel()

    private var rulesUrl: String {
        "https://peraichi.com/landing_pages/view/quickgourmet"
    }

    var body: some View {
        ZStack(alignment: .center) {
            Image("first_view_background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.top)
            Color.gray.opacity(0.5)
                .edgesIgnoringSafeArea(.all)
                .onTapGesture {
                    UIApplication.shared.closeKeyboard()
                }
            VStack {
                Text("食いっくグルメ")
                    .font(.custom(FontManager.Mplus.bold, size: 36))
                    .foregroundColor(ColorManager.font_white)
                    .padding(.top, 60)
                    .padding(.bottom, 2)
                    .padding(.horizontal, 10)
                Text("現在地周辺の飲食店を探そう")
                    .font(.custom(FontManager.Mplus.bold, size: 20))
                    .foregroundColor(ColorManager.font_white)
                    .padding(.bottom, 30)
                    .padding(.horizontal, 10)
                TextField("匿名ログイン", text: $anonymity)
                    .font(.custom(FontManager.Mplus.light, size: 18))
                    .frame(width: 300, height: 44, alignment: .center)
                    .background(ColorManager.white)
                    .foregroundColor(ColorManager.font_black)
                    .cornerRadius(6)
                    .padding(.bottom, 30)
                    .padding(.horizontal, 10)
                LoginButtonView {
                    if anonymity.count >= 1 {
                        userAuthVM.canLogin { result in
                            switch result {
                            case .success:
                                print("Login success.")
                                isShowsIndicator.toggle()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
                                    isShowsIndicator.toggle()
                                    isTapActived.toggle()
                                }
                            case .failure:
                                print("Login failure.", result)
                            }
                        }
                    } else {
                        isShowsAlert.toggle()
                    }
                }
                .padding(.bottom, 5)
                .fullScreenCover(isPresented: $isTapActived, content: {
                    TabBarView()
                })
                .alert(isPresented: $isShowsAlert) {
                    Alert(title: Text("確認"), message: Text("匿名情報を入力してください"), dismissButton: .default(Text("OK")) {})
                }
                Button(action: {
                    isShowsRules.toggle()
                }) {
                    Text("利用規約")
                        .font(.custom(FontManager.Mplus.regular, size: 18))
                        .foregroundColor(ColorManager.font_white)
                        .padding(.bottom, 30)
                        .padding(.horizontal, 10)
                }
                .sheet(isPresented: $isShowsRules) {
                    if let url = URL(string: rulesUrl) {
                        SafariView(url: url)
                            .edgesIgnoringSafeArea(.all)
                    }
                }
            }
            if isShowsIndicator {
                ZStack {
                    ColorManager.black.opacity(0.1)
                        .edgesIgnoringSafeArea(.all)
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 120, height: 120, alignment: .center)
                        .foregroundColor(ColorManager.black.opacity(0.7))
                    VStack {
                        ActivityIndicator()
                        Text("Loading...")
                            .foregroundColor(ColorManager.font_white)
                            .font(.custom(FontManager.Mplus.medium, size: 18))
                            .padding(.top, 5)
                    }
                }
                .animation(.linear)
            }
        }
    }
}

struct FirstScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
