//
//  CardListCell.swift
//  CardGen
//
//  Created by Alex Orlov on 03.08.2021.
//

import UIKit

enum CardListCellState {
    case select
    case remove
}

class CardListCell: UITableViewCell {
    
    @IBOutlet weak var cardNumber: UILabel!
    @IBOutlet weak var cardBackground: UIImageView!
    @IBOutlet weak var cardTitle: UILabel!
    @IBOutlet weak var cardPlaytime: UILabel!
    @IBOutlet weak var cardText: UILabel!
    @IBOutlet weak var stateButton: UIButton!
    private var stateButtonCallback: (() -> ())?
    
    @discardableResult
    func configure(card: Card,
                   state: CardListCellState,
                   stateButtonCallback: (() -> ())?) -> Self {
        
        cardNumber.text = "\(card.group)\(card.number)"
        cardBackground.image = card.type.image()
        cardTitle.text = card.name
        cardPlaytime.text = card.playtime
        cardText.text = card.text
        selectionStyle = .none
        self.stateButtonCallback = stateButtonCallback
        switch state {
        case .select:
            stateButton.setImage(UIImage.init(systemName: "plus"), for: .normal)
        case .remove:
            stateButton.setImage(UIImage.init(systemName: "trash"), for: .normal)
        }
        
        return self
    }
    
    static func nibName() -> String {
        return className()
    }
    @IBAction func stateButtonAction(_ sender: Any) {
        stateButtonCallback?()
    }
}
