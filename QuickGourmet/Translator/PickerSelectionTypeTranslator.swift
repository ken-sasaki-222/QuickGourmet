//
//  PickerSelectionTypeTranslator.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/09/04.
//

import Foundation

class PickerSelectionTypeTranslator {
    static func translate(pickerType: PickerSelectionType) -> Int {
        switch pickerType {
        case .fourMinutesWalk:
            return 1
        case .sevenMinutesWalk:
            return 2
        case .thirteenMinuteWalk:
            return 3
        case .twentyFiveMinutes:
            return 4
        case .thirtyEightMinuteWalk:
            return 5
        }
    }
}
