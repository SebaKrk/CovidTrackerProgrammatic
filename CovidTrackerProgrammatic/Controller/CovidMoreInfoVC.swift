//
//  CovidMoreInfoVC.swift
//  CovidTrackerProgrammatic
//
//  Created by Sebastian Sciuba on 18/01/2021.
//

import UIKit

class CovidMoreInfoVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
    }
    
    func setUpView() {
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDoneButton))
    }
    @objc func handleDoneButton() {
        dismiss(animated: true, completion: nil)
    }
}
