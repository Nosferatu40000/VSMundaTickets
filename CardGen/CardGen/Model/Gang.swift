//
//  Gang.swift
//  CardGen
//
//  Created by Alex Orlov on 05.06.2022.
//

import Foundation

enum Gang: String, CaseIterable {
    case baseCards
    case vansaar
    case grinders

    var cardTypes: [CardType] {
        switch self {
        case .baseCards:
            return [.common]
        case .vansaar:
            return [.common, .vansaar]
        case .grinders:
            return [.common, .grinders]
        }
    }

    var represented: String {
        switch self {
        case .baseCards:
            return "БАЗОВЫЙ НАБОР КАРТ"
        case .vansaar:
            return "VAN SAAR"
        case .grinders:
            return "CORPSE GRINDER CULT"
        }
    }
}
