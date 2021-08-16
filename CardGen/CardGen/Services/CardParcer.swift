//
//  CardParcer.swift
//  CardGen
//
//  Created by Alex Orlov on 03.08.2021.
//

import Foundation

private struct CardParcerConstants {
    
    static let plistName = "Cards"
    static let plistExtension = "plist"
}

struct CardParcer {
    
    static func getCards() -> [Card] {
        
        let targetUrl = Bundle.main.url(forResource: CardParcerConstants.plistName,
                                        withExtension: CardParcerConstants.plistExtension)?.absoluteURL
       
        guard
            let url = targetUrl
            else { return [] }
        
        do {
            let decoder = PropertyListDecoder()
            let data = try Data(contentsOf: url)
            return try decoder.decode([Card].self, from: data)
        } catch {
            return []
        }
    }
}
