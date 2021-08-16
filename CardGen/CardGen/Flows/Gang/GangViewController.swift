//
//  GangViewController.swift
//  CardGen
//
//  Created by Alex Orlov on 13.08.2021.
//

import UIKit

class GangViewController: UIViewController {
    
    var viewModel: GangViewModel!
    
    override func navigationDidSet() {
        
        title = viewModel.title
        navigationController?.tabBarItem.title = viewModel.title
        navigationController?.tabBarItem.image = viewModel.cogImage
    }
}
