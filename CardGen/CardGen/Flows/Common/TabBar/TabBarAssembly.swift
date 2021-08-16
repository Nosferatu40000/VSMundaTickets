//
//  TabBarAssembly.swift
//  CardGen
//
//  Created by Alex Orlov on 13.08.2021.
//

import Swinject


class TabBarAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(TabBarViewModel.self) { resolver in

            let viewModel = TabBarViewModel()
            viewModel.dataManager = resolver.resolve(DataManagerModeProtocol.self)
            
            viewModel.cardViewControllers = [
                resolver.resolve(CardListFullViewController.self)?.navigated(),
                resolver.resolve(CardListSelectedViewController.self)?.navigated(),
                resolver.resolve(GangViewController.self)?.navigated()
            ].compactMap({$0})
            
            return viewModel
            
        }.inObjectScope(.container)
        
        container.register(TabBarViewConroller.self) { resolver in
            
            let viewController = TabBarViewConroller()
            viewController.viewModel = resolver.resolve(TabBarViewModel.self)
            return viewController
        }.inObjectScope(.container)
    }
}
