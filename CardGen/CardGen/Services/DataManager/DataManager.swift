//
//  DataManager.swift
//  CardGen
//
//  Created by Alex Orlov on 03.08.2021.
//

import Foundation

class DataManager {
    
    static let shared = DataManager()
    
    private var cards: [Card] = []
    private(set) var selectedCards: [Card] = []
}

extension DataManager: DataManagerModeProtocol {
    
    func currentMode() -> ApplicationMode {
        return UserDefaults.applicationMode()
    }
    
    func setCurrentMode(_ mode: ApplicationMode) {
        UserDefaults.setApplicationMode(mode)
    }
}

extension DataManager: DataManagerCardProtocol {
    
    func allCards() -> [Card] {
        if cards.count == 0 {
            cards = CardParcer.getCards().reversed()
        }
        return cards
    }
    
    func allSelectedCards() -> [Card] {
        return selectedCards
    }
    
    func selectCard(index: Int) {
        guard index < cards.count else { return }
        
        let card = cards[index]
        if isCardSelected(card: card) == false {
            selectedCards.append(card)
        }
    }
    
    func unselectCard(card: Card) {
        selectedCards.removeAll { selectedCard in
            selectedCard.group == card.group && selectedCard.number == card.number
        }
    }
    
    func cleanSelected() {
        selectedCards = []
    }
    
    func selectRandomCard() {
        
        var unselectedCards = cards
        if selectedCards.count > 0 {
            unselectedCards = cards.filter { card in
                isCardSelected(card: card) == false
            }
        }
        guard unselectedCards.count > 0 else { return }
        
        if unselectedCards.count == 1,
           let noNilCard = unselectedCards.first {
            selectedCards.append(noNilCard)
        } else {
            let randomIndex = Int.random(in: Range(uncheckedBounds: (0, unselectedCards.count-1)))
            let card = unselectedCards[randomIndex]
            selectedCards.append(card)
        }
    }
    
    func isCardSelected(card: Card) -> Bool {
        
        let allreadySelectedCard = selectedCards.first { selectedCard in
            
            selectedCard.group == card.group && selectedCard.number == card.number
        }
        return allreadySelectedCard != nil
    }
}
