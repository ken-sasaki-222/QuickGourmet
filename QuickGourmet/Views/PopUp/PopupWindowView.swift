//
//  PopupWindowView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/05.
//

import SwiftUI

struct PopupWindowView: View {
    @Binding var show: Bool
    @State private var selection = 2
    var searchAction: (Int) -> Void
    private let selectTexts = ["徒歩4分（約300m）", "徒歩7分（約500m）", "徒歩13分（約1km）", "徒歩25分（約2km）", "徒歩38分（約3km）"]

    var body: some View {
        if show {
            ZStack {
                Color.black.opacity(0.3)
                    .edgesIgnoringSafeArea(.all)
                ZStack {
                    VStack(alignment: .center, spacing: 0) {
                        Text("おおよその徒歩時間を選択")
                            .frame(height: 45, alignment: .center)
                            .font(.custom(FontManager.Mplus.medium, size: 18))
                            .padding(.top, 20)
                            .foregroundColor(ColorManager.font_light_dark)
                        Picker(selection: $selection, label: Text("徒歩時間")) {
                            ForEach(0 ..< selectTexts.count) { index in
                                Text(selectTexts[index])
                            }
                        }
                        .pickerStyle(InlinePickerStyle())
                        .frame(maxWidth: 200)
                        .foregroundColor(ColorManager.font_light_dark)
                        SearchButtonView(text: "検索") {
                            withAnimation(.linear(duration: 0.3)) {
                                searchAction(selection)
                                show = false
                            }
                        }
                        .padding(.top, 20)
                        .padding(.bottom, 20)
                    }
                    .frame(maxWidth: 300)
                    .background(ColorManager.baseColor)
                    .cornerRadius(20)
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                        .foregroundColor(ColorManager.white)
                        .offset(x: 0, y: 220)
                        .onTapGesture {
                            show = false
                        }
                }
            }
        }
    }
}

struct PopupWindowView_Previews: PreviewProvider {
    static var previews: some View {
        PopupWindowView(show: .constant(true), searchAction: { _ in

        })
    }
}
