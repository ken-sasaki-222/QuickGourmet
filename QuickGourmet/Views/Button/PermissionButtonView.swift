//
//  PermissionButtonView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/12/14.
//

import SwiftUI

struct PermissionButtonView: View {
    var tapAction: () -> Void

    var body: some View {
        Button(action: {
            tapAction()
        }) {
            Text("次の画面へ")
                .foregroundColor(ColorManager.font_white)
                .font(.custom(FontManager.Mplus.medium, size: 20))
                .frame(width: 300, height: 44, alignment: .center)
                .background(ColorManager.mainColor)
                .cornerRadius(100)
                .lineLimit(1)
        }
    }
}

struct PermissionButton_Previews: PreviewProvider {
    static var previews: some View {
        PermissionButtonView {}
    }
}
