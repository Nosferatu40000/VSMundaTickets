//
//  DataManagerProtocols.swift
//  CardGen
//
//  Created by Alex Orlov on 13.08.2021.
//

import Security
import Foundation

protocol DataManagerCleanCardProtocol {
    func cleanSelected()
    func refreshCards()
}

protocol DataManagerCardProtocol: DataManagerCleanCardProtocol {
    
    func allGangCards() -> [Card]
    func selectCard(index: Int)
    func unselectCard(card: Card)
    func selectRandomCard()
    func isCardSelected(card: Card) -> Bool
    func allSelectedCards() -> [Card]
}

protocol DataManagerModeProtocol: DataManagerCleanCardProtocol {
    
    func currentMode() -> ApplicationMode
    func setCurrentMode(_ mode: ApplicationMode)

    func selectedGang() -> Gang
    func select(gang: Gang)
}

protocol DataManagerGangProtocol {
    
}

protocol DataManagerKeyChainProtocol {
    
    @discardableResult
    func KeyChainSave(key: String, data: Data) -> OSStatus
    
    func KeyChainLoad(key: String) -> Data?
}

protocol DataManagerRealmReadOnlyProtocol {
    
    func loadGangers() -> [Ganger]
}


protocol DataManagerRealmProtocol: DataManagerRealmReadOnlyProtocol {
    
    func saveGanger(_ ganger: Ganger)
}
