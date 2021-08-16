//
//  CardListViewController.swift
//  CardGen
//
//  Created by Alex Orlov on 02.08.2021.
//

import UIKit

enum CardListMode {
    case full
    case selected
}

protocol CardListFullViewController: UIViewController {}
protocol CardListSelectedViewController: UIViewController {}

extension CardListViewController: CardListFullViewController {}
extension CardListViewController: CardListSelectedViewController {}

class CardListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var rightBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var placeholder: UIImageView!
    
    var viewModel: CardListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: CardListCell.nibName(), bundle: Bundle.main)
        tableView.register(nib, forCellReuseIdentifier: CardListCell.nibName())
        tableView.dataSource = self
        
        rightBarButtonItem.image = viewModel.rightBarButtonItemImage()
    }
    
    @objc
    override func navigationDidSet() {
        title = viewModel.title()
        navigationController?.tabBarItem.title = viewModel.title()
        navigationController?.tabBarItem.image = viewModel.tabBarImage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        reloadTable()
    }
    
    @IBAction func addRandomCard(_ sender: Any) {
        viewModel.addCardAction()
        reloadTable()
    }
    
    func reloadTable() {
        tableView.reloadData()
        placeholder.isHidden = viewModel.sourceArray().count > 0
    }
}

extension CardListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let allCards = viewModel.sourceArray()
        guard allCards.count > indexPath.row,
              let cell = tableView.dequeueReusableCell(withIdentifier: CardListCell.nibName()) as? CardListCell
        else { return UITableViewCell() }
        
        let card = allCards[indexPath.row]
        var state: CardListCellState = .select
        if viewModel.isCardSelected(card) {
            state = .remove
        }
        
        return cell.configure(card: card,
                              state: state) { [weak self] in
            
            self?.viewModel.select(for: state,
                                   card: card,
                                   at: indexPath.row)
            self?.reloadTable()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sourceArray().count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
