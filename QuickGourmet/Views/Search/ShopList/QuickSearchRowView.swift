//
//  QuickSearchRowView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/02.
//

import SwiftUI

struct QuickSearchRowView: View {
    var imageString: String
    var genreName: String

    var body: some View {
        ZStack(alignment: .leading) {
            Image(imageString)
                .resizable()
                .frame(width: 380, height: 200)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(20)
            Text("周辺の\(genreName)を検索")
                .foregroundColor(.black)
                .font(.body)
                .fontWeight(.medium)
                .padding(5)
                .background(Color.white.opacity(0.5))
                .offset(y: 50)
            ArrowImage()
                .offset(x: 300, y: 95)
        }
        .padding(.bottom, 25)
    }
}

struct QuickSearchImage_Previews: PreviewProvider {
    static var previews: some View {
        QuickSearchRowView(imageString: "food_izakaya", genreName: "居酒屋")
    }
}
