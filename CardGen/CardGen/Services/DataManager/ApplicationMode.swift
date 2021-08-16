//
//  ApplicationMode.swift
//  CardGen
//
//  Created by Alex Orlov on 13.08.2021.
//

enum ApplicationMode: Int {
    
    case card
    
    func represented() -> String {
        switch self {
        case .card:
            return "Карты"
        }
    }
}
