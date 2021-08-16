//
//  GangAssembly.swift
//  CardGen
//
//  Created by Alex Orlov on 13.08.2021.
//

import Swinject


class GangAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(GangViewController.self) { resolver in
            
            let viewController = GangViewController()
            viewController.viewModel = resolver.resolve(GangViewModel.self)
            return viewController
        }.inObjectScope(.transient)
        
        container.register(GangViewModel.self) { resolver in

            let viewModel = GangViewModel()
            viewModel.dataManager = resolver.resolve(DataManagerModeProtocol.self)
            return viewModel
        }.inObjectScope(.transient)
    }
}
