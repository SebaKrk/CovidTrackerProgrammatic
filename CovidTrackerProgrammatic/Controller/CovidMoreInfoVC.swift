//
//  CovidMoreInfoVC.swift
//  CovidTrackerProgrammatic
//
//  Created by Sebastian Sciuba on 18/01/2021.
//

import UIKit

class CovidMoreInfoVC: UIViewController {
    
    let viewInfo : MoreInfoCell = {
        let view = MoreInfoCell()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
            
        setUpView()
        setUpViewConstraints()
        
    }
    
    func setUpView() {

        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(handleDoneButton))
    }
    
    @objc func handleDoneButton() {
        dismiss(animated: true, completion: nil)
    }
    
    func setUpViewConstraints() {
        view.addSubview(viewInfo)
        viewInfo.translatesAutoresizingMaskIntoConstraints = false
        viewInfo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        viewInfo.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }
}
