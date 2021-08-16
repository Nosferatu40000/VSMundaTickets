//
//  DataManagerAssembly.swift
//  CardGen
//
//  Created by Alex Orlov on 13.08.2021.
//

import Swinject


class DataManagerAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(DataManager.self) { resolver in
            return DataManager()
        }.inObjectScope(.container)
        
        container.register(DataManagerModeProtocol.self) { resolver in
            guard let cardDataManager = resolver.resolve(DataManager.self) else {
                fatalError("can not find dataManager")
            }
            return cardDataManager
        }
        
        container.register(DataManagerCardProtocol.self) { resolver in
            guard let cardDataManager = resolver.resolve(DataManager.self) else {
                fatalError("can not find dataManager")
            }
            return cardDataManager
        }
    }
}
