//
//  RepositoryLocator.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/09/04.
//

import Foundation

class RepositoryLocator: NSObject {
    static var isMock: Bool {
        ProcessInfo.processInfo.environment["MOCK"] == "MOCK"
    }

    static func getGenreTypeRepository() -> GenreTypeRepositoryInterface {
        if isMock {
            return MockGenreTypeRepository()
        } else {
            return GenreTypeRepository()
        }
    }
}
