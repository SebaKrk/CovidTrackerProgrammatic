//
//  CovidTrackerViewController.swift
//  CovidTrackerProgrammatic
//
//  Created by Sebastian Sciuba on 17/12/2020.
//

import UIKit

class CovidTrackerViewController: UIViewController, UISearchBarDelegate{
    
    var tableView = UITableView()
    let reUseIdentifier = "Cell"
    let searchBar = UISearchBar()
    let serwice = Service()
    var covidData = [CovidModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTableView()
        searchBarButton()
        loadData()
        
        
    }
    
    //    MARK: - get JSON
    
    func loadData() {
        serwice.getJason {
            data in
            self.covidData = data
            DispatchQueue.main.async {
                print(self.covidData) // Check JSON response
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - TableView
    
    func setTableView() {
        
        setupTableViewConstraint()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 150
        tableView.register(CovidCell.self, forCellReuseIdentifier: reUseIdentifier)
        
    }
    
    //  MARK: - SearchBar
    
    func searchBarButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(showSearchBar))
    }
    @objc func showSearchBar() {
        setUpSearchBar()
    }
    func setUpSearchBar() {
        searchBar.sizeToFit()
        searchBar.showsCancelButton = true
        searchBar.becomeFirstResponder()
        searchBar.tintColor = .systemBlue
        searchBar.delegate = self
        navigationItem.rightBarButtonItem = nil
        navigationItem.titleView = searchBar
    }
    func setupTableViewConstraint() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
}

extension CovidTrackerViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return covidData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reUseIdentifier, for: indexPath) as! CovidCell
        
        cell.countryLabel.text = covidData[indexPath.row].country
        
        return cell
    }
    
    
}
