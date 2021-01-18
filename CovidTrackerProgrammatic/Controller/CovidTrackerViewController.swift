//
//  CovidTrackerViewController.swift
//  CovidTrackerProgrammatic
//
//  Created by Sebastian Sciuba on 17/12/2020.
//

import UIKit

class CovidTrackerViewController: UIViewController{
    
    var tableView = UITableView()
    let reUseIdentifier = "Cell"
    let serwice = Service()
    var covidData = [CovidModel]()
    var fetchImage = FetchImage()
    
    let searchBar = UISearchBar()
    var inSearchMode = false
    var filterCovidData = [CovidModel]()
    
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
        return inSearchMode ? filterCovidData.count : covidData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reUseIdentifier, for: indexPath) as! CovidCell
        
        let model = inSearchMode ? filterCovidData[indexPath.row] : covidData[indexPath.row]
        cell.update(model: model)
        
        let imageURL = model.countryInfo?.flag
        
        fetchImage.fetchImage(withUrlString: imageURL!) { (image) in
            DispatchQueue.main.async {
                cell.countryFlag.image = image
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CovidMoreInfoVC()
        
        let navVC = UINavigationController(rootViewController: vc)
        navVC.modalPresentationStyle = .fullScreen
        navVC.modalTransitionStyle = .flipHorizontal
        
        present(navVC, animated: true, completion: nil)
    }
}

// MARK: - UISearchBarDelegate

extension CovidTrackerViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        navigationItem.titleView = nil
        searchBarButton()
        inSearchMode = false
        tableView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" || searchBar.text == nil {
            inSearchMode = false
            tableView.reloadData()
            view.endEditing(true)
        } else {
            inSearchMode = true
            filterCovidData = covidData.filter({ $0.country?.range(of: searchText) != nil })
            tableView.reloadData()
        }
    }
}
