//
//  Card.swift
//  CardGen
//
//  Created by Alex Orlov on 03.08.2021.
//

import UIKit

enum CardType: String, Codable {
    
    case common
    case vansaar
    case grinders
    
    func image() -> UIImage? {
        return UIImage(named: self.rawValue)
    }
}

struct Card: Codable {
    
    let playtime: String
    let type: CardType
    let name: String
    let text: String
    let number: Int
    let group: Int
}
