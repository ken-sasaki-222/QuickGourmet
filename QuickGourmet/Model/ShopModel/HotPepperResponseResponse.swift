//
//  HotPepperResponse.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/13.
//

import Foundation

// JSONのレスポンスに合わせて構造体をネストする必要がある
// resultsから読み込み始める

struct HotPepperResponse: Decodable {
    let results: Results
}

struct Results: Decodable {
    let shop: [Shop]
}

struct Shop: Decodable, Identifiable {
    var id: String
    var name: String
    var address: String
    var mobileAccess: String
    var open: String
    var lat: Double
    var lng: Double
    var logoImage: String
    var budget: Budget
    var genre: Genre
    var photo: Photo
    var urls: Urls
    struct Budget: Decodable {
        var average: String
        var name: String
    }

    struct Genre: Decodable {
        var `catch`: String
        var code: String
        var name: String
    }

    struct Photo: Decodable {
        var pc: Pc
    }

    struct Pc: Decodable {
        var l: String
        var s: String
    }

    struct Urls: Decodable {
        var pc: String
    }
}
