//
//  CardListAssembly.swift
//  CardGen
//
//  Created by Alex Orlov on 13.08.2021.
//

import Swinject
import UIKit


class CardListAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(CardListFullViewController.self) { resolver in
            
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            guard let viewController = storyBoard.instantiateViewController(identifier: "CardListViewController") as? CardListViewController else {
                fatalError("Проверь стриборду")
            }
            let viewModel = resolver.resolve(CardListViewModel.self)
            viewModel?.mode = .full
            viewController.viewModel = viewModel
            return viewController
            
        }.inObjectScope(.transient)
        
        container.register(CardListSelectedViewController.self) { resolver in
            
            let storyBoard = UIStoryboard(name: "Main", bundle: nil)
            guard let viewController = storyBoard.instantiateViewController(identifier: "CardListViewController") as? CardListViewController else {
                fatalError("Проверь стриборду")
            }
            let viewModel = resolver.resolve(CardListViewModel.self)
            viewModel?.mode = .selected
            viewController.viewModel = viewModel
            return viewController
        }.inObjectScope(.transient)
        
        container.register(CardListViewModel.self) { resolver in

            let viewModel = CardListViewModel()
            viewModel.dataManager = resolver.resolve(DataManagerCardProtocol.self)
            return viewModel
        }.inObjectScope(.transient)
    }
}
