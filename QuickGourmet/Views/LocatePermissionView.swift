//
//  LocatePermissionView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/12/14.
//

import SwiftUI

struct LocatePermissionView: View {
    @ObservedObject var locatePermissionVM = LocatePermissionViewModel()

    var body: some View {
        ZStack {
            Image("food_location")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            ColorManager.black.opacity(0.3)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Text("位置情報をオンにする")
                    .font(.custom(FontManager.Mplus.medium, size: 32))
                    .foregroundColor(ColorManager.white)
                    .lineLimit(1)
                    .padding(.bottom, 3)
                Text("食いっくグルメの機能を利用するには、\n位置情報をオンにする必要があります")
                    .font(.custom(FontManager.Mplus.medium, size: 16))
                    .foregroundColor(ColorManager.white)
                    .lineLimit(2)
                    .padding(.bottom, 30)
                PermissionButtonView {
                    let status = locatePermissionVM.getStatus()
                    locatePermissionVM.tapNextPageButton(status: status)
                }
                .padding(.bottom, 50)
            }
            .alert(isPresented: $locatePermissionVM.isShowsAlert) {
                switch locatePermissionVM.alertType {
                case .failLocatePermission:
                    return Alert(
                        title: Text("エラー"),
                        message: Text("位置情報の許可に失敗しました"),
                        dismissButton: .default(Text("やり直す"))
                    )
                case .successLocatePermission:
                    return Alert(
                        title: Text("確認"),
                        message: Text("位置情報を許可しました"),
                        dismissButton: .default(Text("OK"), action: {
                            DispatchQueue.main.async {
                                RootViewHelper.shared.changeRootView(rootView: .tracking)
                            }
                        })
                    )
                }
            }
        }
    }
}

struct CurrentLocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocatePermissionView()
    }
}
