//
//  DataManagerProtocols.swift
//  CardGen
//
//  Created by Alex Orlov on 13.08.2021.
//

protocol DataManagerCardProtocol {
    
    func allCards() -> [Card]
    func selectCard(index: Int)
    func unselectCard(card: Card)
    func cleanSelected()
    func selectRandomCard()
    func isCardSelected(card: Card) -> Bool
    func allSelectedCards() -> [Card]
}

protocol DataManagerModeProtocol {
    
    func currentMode() -> ApplicationMode
    func setCurrentMode(_ mode: ApplicationMode)
}
