//
//  AppDelegate+ApplicationMode.swift
//  CardGen
//
//  Created by Alex Orlov on 13.08.2021.
//

import Foundation


extension UserDefaults {
    
    private static let applicationModeKey = "ApplicationModeKey"
    private static let selectedGangKey = "SelectedGangKey"
    
    static func applicationMode() -> ApplicationMode {
        let rawMode = standard.integer(forKey: applicationModeKey)
        guard let mode = ApplicationMode(rawValue: rawMode) else { return .card }
        return mode
    }
    
    static func setApplicationMode(_ mode: ApplicationMode) {
        standard.set(mode.rawValue, forKey: applicationModeKey)
    }

    static func selectedGang() -> Gang {
        guard let raw = standard.string(forKey: selectedGangKey), let gang = Gang(rawValue: raw) else {
            return .vansaar
        }
        return gang
    }

    static func setSelected(gang: Gang) {
        standard.set(gang.rawValue, forKey: selectedGangKey)
    }
}
