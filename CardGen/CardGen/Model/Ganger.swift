//
//  Ganger.swift
//  CardGen
//
//  Created by Alex Orlov on 17.08.2021.
//

protocol GangerType {}

enum CommonGangerType: GangerType {
    case leader
    case champion
    case ganger
    case juve
    case hungerOn
    case hiredGun
}

enum VanSaarRaceType: GangerType {
    case prime
    case augmek
    case areotek
    case tek
    case subtek
    case neotek
    
    func commonType() -> GangerType {
        switch self {
        case .prime:
            return CommonGangerType.leader
        case .augmek:
            return CommonGangerType.champion
        case .areotek:
            return CommonGangerType.champion
        case .tek:
            return CommonGangerType.ganger
        case .subtek:
            return CommonGangerType.juve
        case .neotek:
            return CommonGangerType.juve
        }
    }
}

struct Ganger {
    
    let move: Int
    let weaponSkill: Int
    let ballisticSkill: Int
    let strength: Int
    let toughness: Int
    let wounds: Int
    let initiative: Int
    let attacks: Int
    let leadership: Int
    let cool: Int
    let willpower: Int
    let intelligence: Int
    let type: GangerType
    
    let guns: [Gun]
    let skills: [Skill]
    let wargear: [Wargear]
}
