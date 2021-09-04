//
//  GenreTypeRepository.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/09/04.
//

import Foundation

class GenreTypeRepository {
    func getGenreCode(genre: GenreType) -> String? {
        let genreCode = GenreTypeTranslator.translate(genre: genre)
        return genreCode
    }
}
