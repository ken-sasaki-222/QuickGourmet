//
//  FirstScreenView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/11.
//

import SwiftUI

struct FirstScreenView: View {
    @State private var isTapActived = false

    var body: some View {
        NavigationView {
            ZStack {
                Image("first_view_background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                Color.white.opacity(0.5)
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    Text("食いっくグルメはユーザーの現在地から\n徒歩圏内の飲食店情報を提供します。")
                        .fontWeight(.medium)
                        .font(.title3)
                        .lineLimit(3)
                        .offset(x: 0, y: -200)
                    Button(action: {
                        isTapActived.toggle()
                    }) {
                        Text("食いっくグルメをはじめる")
                            .foregroundColor(Color.white)
                            .fontWeight(.medium)
                            .font(.title3)
                            .padding(.vertical, 20)
                            .padding(.horizontal, 60)
                            .background(Color.green)
                            .cornerRadius(100)
                            .lineLimit(1)
                    }
                    .fullScreenCover(isPresented: $isTapActived, content: {
                        QuickSearchView()
                    })
                }
            }
            .navigationTitle("食いっくグルメ")
        }
    }
}

struct FirstScreenView_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreenView()
    }
}
