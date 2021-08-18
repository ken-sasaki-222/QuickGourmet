//
//  FirstScreenView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/11.
//

import SwiftUI

struct FirstScreenView: View {
    @State private var isTapActived = false
    @State private var isShowsAlert = false
    @State private var anonymity = ""
    private let userAuthVM = UserAuthViewModel()

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
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 60)
                    .padding(.bottom, 30)
                    .padding(.horizontal, 10)
                TextField("匿名ログイン（2文字以上）", text: $anonymity)
                    .frame(width: 300, height: 44, alignment: .center)
                    .background(Color.white)
                    .cornerRadius(6)
                    .padding(.bottom, 30)
                    .padding(.horizontal, 10)
                LoginButtonView {
                    if userAuthVM.isValidateAnonymity(anonymity: anonymity) {
                        print("Login Complete.")
                        print("ユーザー名:", anonymity)
                        // isTapActived.toggle()
                    } else {
                        print("Login Failed.")
                        isShowsAlert.toggle()
                    }
                }
                .fullScreenCover(isPresented: $isTapActived, content: {
                    TabBarView()
                })
                .alert(isPresented: $isShowsAlert) {
                    Alert(title: Text("確認"), message: Text("匿名情報を入力してください"), dismissButton: .default(Text("OK")) {})
                }
            }
        }
    }
}

struct FirstScreenView_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreenView()
    }
}
