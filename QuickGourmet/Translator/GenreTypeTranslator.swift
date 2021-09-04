//
//  GenreTypeTranslator.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/09/04.
//

import Foundation

class GenreTypeTranslator {
    func translate(genre: GenreType) -> String {
        switch genre {
        case .izakaya:
            return "G001"
        case .dainingubar:
            return "G002"
        case .sousakuryouri:
            return "G003"
        case .wasyoku:
            return "G004"
        case .yousyoku:
            return "G005"
        case .italian:
            return "G006"
        case .tyuuka:
            return "G007"
        case .yakiniku:
            return "G008"
        case .aziaryouri:
            return "G009"
        case .kakukokuryouri:
            return "G010"
        case .karaoke:
            return "G011"
        case .kakuteru:
            return "G012"
        case .ramen:
            return "G013"
        case .cafe:
            return "G014"
        case .other:
            return "G015"
        case .okonomiyaki:
            return "G016"
        case .corearyouri:
            return "G017"
        }
    }
}
