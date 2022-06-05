//
//  CardListViewModel.swift
//  CardGen
//
//  Created by Alex Orlov on 13.08.2021.
//

import UIKit


class CardListViewModel {
    
    var mode: CardListMode = .full
    var dataManager: DataManagerCardProtocol!
    
    func title() -> String {
        switch mode {
        case .full:
            return "Все карты"
        case .selected:
            return "Выбранные карты"
        }
    }
    
    func tabBarImage() -> UIImage? {
        switch mode {
        case .full:
            return UIImage(systemName: "doc.text")
        case .selected:
            return UIImage(systemName: "arrow.up.doc")
        }
    }
    
    func rightBarButtonItemImage() -> UIImage? {
        switch mode {
        case .full:
            return UIImage(systemName: "swift")
        case .selected:
            return UIImage(systemName: "trash")
        }
    }
    
    func addCardAction() {
        switch mode {
        case .full:
            dataManager.selectRandomCard()
        case .selected:
            dataManager.cleanSelected()
        }
    }
    
    func sourceArray() -> [Card] {
        switch mode {
        case .full:
            return dataManager.allGangCards()
        case .selected:
            return dataManager.allSelectedCards()
        }
    }
    
    func isCardSelected(_ card: Card) -> Bool {
        return dataManager.isCardSelected(card: card)
    }
    
    func select(for state: CardListCellState,
                card: Card,
                at index: Int) {
        
        switch state {
        case .select:
            dataManager.selectCard(index: index)
        case .remove:
            dataManager.unselectCard(card: card)
        }
    }
}
