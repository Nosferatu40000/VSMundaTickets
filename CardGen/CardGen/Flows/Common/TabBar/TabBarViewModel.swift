//
//  TabBarViewModel.swift
//  CardGen
//
//  Created by Alex Orlov on 13.08.2021.
//

import UIKit

class TabBarViewModel {
    
    var cardViewControllers: [UIViewController]!
    var dataManager: DataManagerModeProtocol!
    
    func currentModeControllers() -> [UIViewController] {
        
        switch dataManager.currentMode() {
        case .card:
            return cardViewControllers
        }
    }
}
