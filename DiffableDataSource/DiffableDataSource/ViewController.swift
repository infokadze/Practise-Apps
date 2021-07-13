//
//  ViewController.swift
//  DiffableDataSource
//
//  Created by Harry Crocks on 12.07.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    enum Section {
        case first
    }
    
    struct Fruit: Hashable {
        let title: String
        let identifier = UUID()
        
        func hash(into hasher: inout Hasher) {
            hasher.combine(identifier)
        }
    }
    
    var dataSource: UITableViewDiffableDataSource<Section, Fruit>!
    
    var fruits = [Fruit]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.frame = view.bounds
         
        dataSource = UITableViewDiffableDataSource(tableView: tableView, cellProvider: { (tableView, indexPath, model) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = model.title
            return cell
        })
        
        title = "My Fruits"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .done, target: self, action: #selector(didTapped))
    }
    
    @objc func didTapped() {
        let actionSheet = UIAlertController(title: "Select Fruit", message: nil, preferredStyle: .actionSheet)
        
        for x in 0...100 {
            actionSheet.addAction(UIAlertAction(title: "Fruit \(x + 1)", style: .default, handler: { [weak self] _ in
                let fruit = Fruit(title: "Fruit \(x + 1)")
                self?.fruits.append(fruit)
                self?.updateDataSource()
            }))
        }
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(actionSheet, animated: true)
    }
        func updateDataSource() {
            var snapshot = NSDiffableDataSourceSnapshot<Section, Fruit>()
            snapshot.appendSections([.first])
            snapshot.appendItems(fruits)
            
            dataSource.apply(snapshot, animatingDifferences: true)
        
    }

}

