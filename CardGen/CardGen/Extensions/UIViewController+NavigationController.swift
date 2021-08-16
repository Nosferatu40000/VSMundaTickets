//
//  UIViewController+NavigationController.swift
//  CardGen
//
//  Created by Alex Orlov on 13.08.2021.
//

import UIKit

extension UIViewController {
    
    open func navigated() -> UINavigationController {
        let navigationViewController = UINavigationController(rootViewController: self)
        navigationDidSet()
        return navigationViewController
    }
    
    @objc
    open func navigationDidSet() {}
}
