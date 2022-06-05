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
    let gangList = Gang.allCases
    
    var dataManager: DataManagerModeProtocol!
    
    func currentMode() -> ApplicationMode {
        dataManager.currentMode()
    }
    
    func changeMode(_ mode: ApplicationMode) {
        dataManager.setCurrentMode(mode)
    }

    func selectedGang() -> Gang {
        dataManager.selectedGang()
    }

    func select(gang: Gang) {
        dataManager.cleanSelected()
        dataManager.select(gang: gang)
        dataManager.refreshCards()
    }
}
