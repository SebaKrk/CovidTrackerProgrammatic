//
//  MoreInfoCell.swift
//  CovidTrackerProgrammatic
//
//  Created by Sebastian Sciuba on 18/01/2021.
//

import UIKit

class MoreInfoCell : UIView {
    
    let countryLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 34)
        return label
    }()
    
    
    let countryImage : UIImageView = {
        let image = UIImageView()
        
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.borderColor = UIColor.black.cgColor
        image.layer.borderWidth = 4
        
        return image
    }()
    
    let populationLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let todayLabel : UILabel = {
        let label = UILabel()
        label.text = "TODAY"
        label.textColor = .systemBackground
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.backgroundColor = .red
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        return label
    }()
    
    let todayCasesLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .darkGray
        return label
    }()
    
    let todayDeathsLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .darkGray
        return label
    }()
    
    let todayRecoveredLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .darkGray
        return label
    }()
    
    let totalLabel : UILabel = {
        var label = UILabel()
        label.text = " TOTAL "
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.backgroundColor = .red
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        return label
    }()
    
    let activeLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .darkGray
        return label
    }()
    
    let totalCasesLabel : UILabel = {
       let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .darkGray
        return label
    }()
    
    let totalDeathLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .darkGray
        
        return label
    }()
    
    let totalRecoveredLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .darkGray
        
        return label
    }()
    let totalTestsLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .darkGray
        return label
    }()
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpViewConstraints()
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(model: CovidModel) {
        
        countryLabel.text = "\(model.country!)"
        populationLabel.text = "\(model.population!)"
        
        todayCasesLabel.text = "Confirmed: \(model.todayCases!)"
        todayDeathsLabel.text = "Deaths: \(model.todayDeaths!)"
        todayRecoveredLabel.text = "Recovered: \(model.todayRecovered!)"
        
        activeLabel.text = "Active: \(model.active!)"
        totalCasesLabel.text = "Confirmed: \(model.cases!)"
        totalDeathLabel.text = "Deaths: \(model.deaths!)"
        totalRecoveredLabel.text = "Recovered: \(model.recovered!)"
        totalTestsLabel.text = "Test: \(model.tests!)"
    }
    
    func setUpViewConstraints() {
        addSubview(countryLabel)
        countryLabel.translatesAutoresizingMaskIntoConstraints = false
        countryLabel.topAnchor.constraint(equalTo: topAnchor, constant: 120).isActive = true
        countryLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(countryImage)
        countryImage.translatesAutoresizingMaskIntoConstraints = false
        countryImage.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 20).isActive = true
        countryImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        countryImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        countryImage.widthAnchor.constraint(equalToConstant: 140).isActive = true
        
        
        addSubview(populationLabel)
        populationLabel.translatesAutoresizingMaskIntoConstraints = false
        populationLabel.topAnchor.constraint(equalTo: countryImage.bottomAnchor, constant: 5).isActive = true
        populationLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(todayLabel)
        todayLabel.translatesAutoresizingMaskIntoConstraints = false
        todayLabel.topAnchor.constraint(equalTo: populationLabel.bottomAnchor,constant: 50).isActive = true
        todayLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(todayCasesLabel)
        todayCasesLabel.translatesAutoresizingMaskIntoConstraints = false
        todayCasesLabel.topAnchor.constraint(equalTo: todayLabel.bottomAnchor, constant: 30).isActive = true
        todayCasesLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(todayDeathsLabel)
        todayDeathsLabel.translatesAutoresizingMaskIntoConstraints = false
        todayDeathsLabel.topAnchor.constraint(equalTo: todayCasesLabel.bottomAnchor).isActive = true
        todayDeathsLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(todayRecoveredLabel)
        todayRecoveredLabel.translatesAutoresizingMaskIntoConstraints = false
        todayRecoveredLabel.topAnchor.constraint(equalTo: todayDeathsLabel.bottomAnchor).isActive = true
        todayRecoveredLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        addSubview(totalLabel)
        totalLabel.translatesAutoresizingMaskIntoConstraints = false
        totalLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        totalLabel.topAnchor.constraint(equalTo: todayRecoveredLabel.bottomAnchor, constant: 30).isActive = true
        
        addSubview(activeLabel)
        activeLabel.translatesAutoresizingMaskIntoConstraints = false
        activeLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        activeLabel.topAnchor.constraint(equalTo: totalLabel.bottomAnchor, constant: 30).isActive = true
        
        addSubview(totalCasesLabel)
        totalCasesLabel.translatesAutoresizingMaskIntoConstraints = false
        totalCasesLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        totalCasesLabel.topAnchor.constraint(equalTo: activeLabel.bottomAnchor).isActive = true
        
        addSubview(totalDeathLabel)
        totalDeathLabel.translatesAutoresizingMaskIntoConstraints = false
        totalDeathLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        totalDeathLabel.topAnchor.constraint(equalTo: totalCasesLabel.bottomAnchor).isActive = true
        
        addSubview(totalRecoveredLabel)
        totalRecoveredLabel.translatesAutoresizingMaskIntoConstraints = false
        totalRecoveredLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        totalRecoveredLabel.topAnchor.constraint(equalTo: totalDeathLabel.bottomAnchor).isActive = true
        
        addSubview(totalTestsLabel)
        totalTestsLabel.translatesAutoresizingMaskIntoConstraints = false
        totalTestsLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        totalTestsLabel.topAnchor.constraint(equalTo: totalRecoveredLabel.bottomAnchor).isActive = true
    }
}

