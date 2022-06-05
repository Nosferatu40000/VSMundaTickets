//
//  GangViewController.swift
//  CardGen
//
//  Created by Alex Orlov on 13.08.2021.
//

import UIKit

class GangViewController: UIViewController {
    
    var viewModel: GangViewModel!
    var table: UITableView?
    
    override func navigationDidSet() {
        
        title = viewModel.title
        navigationController?.tabBarItem.title = viewModel.title
        navigationController?.tabBarItem.image = viewModel.cogImage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
    }
    
    private func setTableView() {
        
        let tableView = UITableView()
        view.addSubview(tableView)
        table = tableView
        registerCells()
        table?.dataSource = self
        table?.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    func registerCells() {
        let nib = UINib(nibName: GangListCell.className(), bundle: Bundle.main)
        table?.register(nib, forCellReuseIdentifier: GangListCell.className())
    }
}

extension GangViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let gang = viewModel.gangList[indexPath.row]
        if viewModel.selectedGang() != gang {
            viewModel.select(gang: gang)
            tableView.reloadData()
        }
    }
}

extension GangViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.gangList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GangListCell.className()) as? GangListCell else {
            return UITableViewCell()
        }
        let gang = viewModel.gangList[indexPath.row]
        cell.title.text = gang.represented
        if gang == viewModel.selectedGang() {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
}
