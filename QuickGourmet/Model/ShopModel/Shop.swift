//
//  Shop.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/07/13.
//

import Foundation


struct Shop: Decodable, Identifiable {
    var id: String
    var name: String
    var mobileAccess: String
    var open: String
    var lat: Int
    var lng: Int
    var budget: Budget
    var genre: Genre
    var photo: Photo
    var urls: URLS
    
    struct Budget: Decodable {
        var average: String
        var code: String
        var name: String
    }
    
    struct Genre: Decodable {
        var catche: String
        var code: String
        var genreName: String
    }

    struct Photo: Decodable  {
        var mobile: Mobile

        struct Mobile: Decodable {
            var l: String
            var s: String
        }
    }

    struct URLS: Decodable {
        var pc: String
    }
}

