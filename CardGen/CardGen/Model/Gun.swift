//
//  Gun.swift
//  CardGen
//
//  Created by Alex Orlov on 17.08.2021.
//

struct ModifiedValue {
    let value: Int
    let upModifier: Int
    let lowModifier: Int
}

struct Range {
    
    let short: Int
    let long: Int
}

struct Gun {
    
    let range: Range
    let strength: Int
    let damage: Int
    let armorPiercing: Int
    let ammoCheck: Int
    let skills: [Skill]
    let modifications: [Modification]
}
