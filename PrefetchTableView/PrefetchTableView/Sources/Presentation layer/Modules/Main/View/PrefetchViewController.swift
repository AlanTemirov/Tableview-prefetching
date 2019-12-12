//
//  PrefetchViewController.swift
//  PrefetchTableView
//
//  Created by Alan on 10/12/2019.
//  Copyright © 2019 Alan. All rights reserved.
//

import UIKit

class PrefetchViewController: UIViewController, PrefetchViewProtocol {
    
    var output: PrefetchViewOutput!
    var dataSource: PrefetchDataProvider?
    
    private var tableView: UITableView = {
        let table = UITableView()
        table.backgroundColor = .white
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        output.onDidLoad()
        
        view.backgroundColor = .white
        
        addSubviews()
        setupConstraints()
        
        setupTableView()
        registerCells()
    }
    
    // MARK: - Routine -
    
    private func addSubviews() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        // Table view
        let bottomTableViewConstraint = tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        let topTableViewConstraint = tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        let leftTableViewConstraint = tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let rightTableViewConstraint = tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        NSLayoutConstraint.activate([bottomTableViewConstraint, topTableViewConstraint, leftTableViewConstraint, rightTableViewConstraint])
    }
    
    // MARK: - Setup table view -
    
    private func setupTableView() {
        tableView.delegate = dataSource
        tableView.dataSource = dataSource
        tableView.prefetchDataSource = dataSource
    }
    
    private func registerCells() {
        tableView.register(PrefetchCell.self, forCellReuseIdentifier: PrefetchCell.reuseId)
    }
    
}

extension PrefetchViewController: PrefetchViewInput {
    
    func reloadRows(at index: Int) {
        let indexPath = IndexPath(row: index, section: 0)
        if tableView.indexPathsForVisibleRows?.contains(indexPath) ?? false {
            tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .fade)
        }
    }
    
}
