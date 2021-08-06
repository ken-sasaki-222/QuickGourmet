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
    let selectTexts = ["おおよそ3分", "おおよそ7分", "おおよそ13分", "おおよそ20分", "おおよそ30分"]
    let action = {}

    var body: some View {
        if show {
            ZStack {
                Color.black.opacity(0.3)
                    .edgesIgnoringSafeArea(.all)
                ZStack {
                    VStack(alignment: .center, spacing: 0) {
                        Text("おおよその徒歩時間を選択")
                            .frame(height: 45, alignment: .center)
                            .font(.title3)
                            .padding(.top, 20)
                        Picker(selection: $selection, label: Text("徒歩時間")) {
                            ForEach(0 ..< selectTexts.count) { index in
                                Text(selectTexts[index])
                            }
                        }
                        .frame(maxWidth: 200)
                        SearchButton(text: "検索") {
                            withAnimation(.linear(duration: 0.3)) {
                                action()
                                show = false
                            }
                        }
                        .padding(.top, 20)
                        .padding(.bottom, 20)
                    }
                    .frame(maxWidth: 300)
                    .background(Color.white)
                    .cornerRadius(20)
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                        .foregroundColor(Color.white)
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
        PopupWindowView(show: .constant(true))
    }
}
