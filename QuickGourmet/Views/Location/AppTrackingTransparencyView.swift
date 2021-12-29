//
//  AppTrackingTransparencyView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/12/25.
//

import SwiftUI

struct AppTrackingTransparencyView: View {
    private let appTrackingTransparencyViewModel = AppTrackingTransparencyViewModel()

    var body: some View {
        ZStack {
            Image("food_tracking")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            ColorManager.black.opacity(0.3)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                Text("広告トラッキングを許可してください")
                    .font(.custom(FontManager.Mplus.medium, size: 22))
                    .foregroundColor(ColorManager.white)
                    .lineLimit(1)
                    .padding(.bottom, 3)
                Text("次の画面で『許可』を選択することで、\nあなたに関係のない広告が表示されなくなります")
                    .font(.custom(FontManager.Mplus.medium, size: 16))
                    .foregroundColor(ColorManager.white)
                    .lineLimit(2)
                    .padding(.bottom, 30)
                PermissionButtonView {
                    appTrackingTransparencyViewModel.getAuthorizationStatus()
                }
                .padding(.bottom, 50)
            }
        }
    }
}

struct AppTrackingTransparencyView_Previews: PreviewProvider {
    static var previews: some View {
        AppTrackingTransparencyView()
    }
}
