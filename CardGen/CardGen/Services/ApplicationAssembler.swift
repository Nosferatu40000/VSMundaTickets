//
//  ApplicationAssembler.swift
//  CardGen
//
//  Created by Alex Orlov on 03.08.2021.
//

import Swinject

struct ApplicationAssembler {
    
    private static func allAssemblies() -> [Assembly] {
        return [
            CardListAssembly(),
            TabBarAssembly(),
            GangAssembly(),
            DataManagerAssembly()
        ]
    }

    static let shared = Assembler(allAssemblies())

    static func resolve<Service>(_ serviceType: Service.Type) -> Service? {
        return shared.resolver.resolve(serviceType)
    }
}
