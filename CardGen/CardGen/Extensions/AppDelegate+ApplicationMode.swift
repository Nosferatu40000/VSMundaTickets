//
//  AppDelegate+ApplicationMode.swift
//  CardGen
//
//  Created by Alex Orlov on 13.08.2021.
//

import Foundation


extension UserDefaults {
    
    private static let applicationModeKey = "ApplicationModeKey"
    
    static func applicationMode() -> ApplicationMode {
        let rawMode = standard.integer(forKey: applicationModeKey)
        guard let mode = ApplicationMode(rawValue: rawMode) else { return .card }
        return mode
    }
    
    static func setApplicationMode(_ mode: ApplicationMode) {
        standard.set(mode.rawValue, forKey: applicationModeKey)
    }
}
