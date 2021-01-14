//
//  CovidTrackerViewController.swift
//  CovidTrackerProgrammatic
//
//  Created by Sebastian Sciuba on 17/12/2020.
//

import UIKit

class CovidTrackerViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setTableView()
        
        
        
    }
// MARK: - TableView
    
    func setTableView() {
        
        setupTableViewConstraint()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 150

    }
    
    func setupTableViewConstraint() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    

}
