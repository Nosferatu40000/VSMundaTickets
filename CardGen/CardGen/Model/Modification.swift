//
//  Modification.swift
//  CardGen
//
//  Created by Alex Orlov on 18.08.2021.
//

enum ModificationType {
    
    case save
    case ballistic
    case toughness
}

struct Modification {
    
    let type: ModificationType
    let value: Int
    let name: String
}
