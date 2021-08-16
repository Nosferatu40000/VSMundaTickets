//
//  GangViewModel.swift
//  CardGen
//
//  Created by Alex Orlov on 13.08.2021.
//

import UIKit


class GangViewModel {
    
    let title = "Банда"
    let cogImage = UIImage(systemName: "ant.circle")
    
    var dataManager: DataManagerModeProtocol!
    
    func currentMode() -> ApplicationMode {
        return dataManager.currentMode()
    }
    
    func changeMode(_ mode: ApplicationMode) {
        return dataManager.setCurrentMode(mode)
    }
}
