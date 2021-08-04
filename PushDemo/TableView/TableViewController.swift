//
//  TableViewController.swift
//  PushDemo
//
//  Created by Mac on 24.07.2021.
//

import UIKit

protocol TableViewModelDelegate {
    func showNotificationAlert(alert: UIAlertController)
}

class TableViewController: UIViewController {
    
    private let tableView = UITableView()
    var tableViewModel: TableViewModel!

    override func loadView() {
        super.loadView()
        tableViewModel.tableviewDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        title = ConstantNames.mainTitle.rawValue
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        tableView.register(UITableViewCell.self,
                           forCellReuseIdentifier: ConstantIdentifier.cellId.rawValue)
        tableView.dataSource = self
        tableView.delegate = self
    }
}
// MARK: - Table view data source
extension TableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView,
                   numberOfRowsInSection section: Int) -> Int {
        return tableViewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ConstantIdentifier.cellId.rawValue,
            for: indexPath)
        cell.textLabel?.text = tableViewModel.getCell(at: indexPath)
        cell.textLabel?.textColor = .gray
    
        return cell
    }
}

// MARK: - Table View Delegate
extension TableViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView,
                   didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.textLabel?.textColor = .red

        tableViewModel.didTapOnCell(at: indexPath)
    }
    
    func tableView(_ tableView: UITableView,
                   didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        cell?.textLabel?.textColor = .gray
    }
}
// MARK: - Table View Model Delegate
extension TableViewController: TableViewModelDelegate {
    func showNotificationAlert(alert: UIAlertController) {
        present(alert, animated: true)
    }
}


