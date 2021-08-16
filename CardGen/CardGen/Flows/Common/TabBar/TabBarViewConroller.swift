//
//  TabBarViewConroller.swift
//  CardGen
//
//  Created by Alex Orlov on 13.08.2021.
//

import UIKit


class TabBarViewConroller: UITabBarController {
    
    var viewModel: TabBarViewModel! {
        didSet {
            setViewControllers(viewModel.currentModeControllers(), animated: true)
        }
    }
}
