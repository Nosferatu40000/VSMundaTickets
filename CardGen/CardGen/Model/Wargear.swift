//
//  Wargear.swift
//  CardGen
//
//  Created by Alex Orlov on 17.08.2021.
//

enum WargearType {
    
    case armor
    case other
}

struct Wargear {
    
    let name: String
    let type: WargearType
    let description: String
    let modifications: [Modification]
}
