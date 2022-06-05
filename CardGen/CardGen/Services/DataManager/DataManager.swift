//
//  DataManager.swift
//  CardGen
//
//  Created by Alex Orlov on 03.08.2021.
//

import Foundation
import Security

class DataManager {
    
    static let shared = DataManager()
    
    private var allCards: [Card] = []
    private var cards: [Card] = []
    private(set) var selectedCards: [Card] = []
}

extension DataManager: DataManagerModeProtocol {

    func selectedGang() -> Gang {
        UserDefaults.selectedGang()
    }
    
    func select(gang: Gang) {
        UserDefaults.setSelected(gang: gang)
    }
    
    func currentMode() -> ApplicationMode {
        return UserDefaults.applicationMode()
    }
    
    func setCurrentMode(_ mode: ApplicationMode) {
        UserDefaults.setApplicationMode(mode)
    }
}

extension DataManager: DataManagerCardProtocol {
    
    func allGangCards() -> [Card] {
        if allCards.count == 0 {
            allCards = CardParcer.getCards().sorted(by: { cardOne, cardTwo in
                if cardOne.group != cardTwo.group {
                    return cardOne.group < cardTwo.group
                }
                return cardOne.number < cardTwo.number
            })
        }
        if cards.isEmpty {
            refreshCards()
        }
        return cards
    }
    
    func refreshCards() {
        let gangCardTypes = selectedGang().cardTypes
        cards = allCards.filter { card in
            if card.type != .common {
                return gangCardTypes.contains(card.type)
            }
            if allCards.filter({ innerCard in
                innerCard.group == card.group && innerCard.number == card.number && gangCardTypes.contains(innerCard.type)
            }).count > 1 {
                return false
            }
            return true
        }
    }
    
    func allSelectedCards() -> [Card] {
        selectedCards
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
            let randomIndex = Int.random(in: 0..<unselectedCards.count-1)
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

extension DataManager: DataManagerKeyChainProtocol {
    
    @discardableResult
    func KeyChainSave(key: String, data: Data) -> OSStatus {
        let query = [kSecClass as String: kSecClassGenericPassword as String,
                     kSecAttrAccount as String: key,
                     kSecValueData as String: data] as [String : Any]
        SecItemDelete(query as CFDictionary)
        return SecItemAdd(query as CFDictionary, nil)
    }
    
    func KeyChainLoad(key: String) -> Data? {
        guard let boolean = kCFBooleanTrue else { return nil }
        let query = [kSecClass as String: kSecClassGenericPassword,
                     kSecAttrAccount as String: key,
                     kSecReturnData as String: boolean,
                     kSecMatchLimit as String: kSecMatchLimitOne] as [String : Any]
        var dataTypeRef: AnyObject? = nil
        let status: OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        guard status == noErr, let result = dataTypeRef as? Data else { return nil }
        return result
    }
}

extension DataManager: DataManagerRealmProtocol {
    
    func saveGanger(_ ganger: Ganger) {
        
    }
    
    func loadGangers() -> [Ganger] {
        []
    }
}
