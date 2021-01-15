//
//  CovidCell.swift
//  CovidTrackerProgrammatic
//
//  Created by Sebastian Sciuba on 15/01/2021.
//

import UIKit

class CovidCell : UITableViewCell {
    
    let containerView : UIView = {
        let view = UIView()
        view.clipsToBounds = true
        return view
    }()
    
    let countryFlag : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.layer.cornerRadius = 35
        image.clipsToBounds = true
        return image
    }()
    
    let countryLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 26)
        label.textColor = .black
        return label
    }()
    
    let continentLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.backgroundColor = .systemBlue
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        return label
    }()
    
    let casesLabel : UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let deathLabel : UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let activeLabel : UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let testLabel : UILabel = {
        let label = UILabel()
        label.textColor = .systemGray
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let todayLabel : UILabel = {
        let label = UILabel()
        label.text = "TODAY"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.backgroundColor = .systemRed
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        return label
    }()
    
    let todayCasesLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let todatDeathLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    //    MARK: INIT
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViewConstarints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(model: CovidModel){
        countryLabel.text = model.country
        continentLabel.text = model.continent
        casesLabel.text = String("Case: \(model.cases!)")
        deathLabel.text = String("Death: \(model.deaths!)")
        activeLabel.text = String("Active: \(model.active!)")
        testLabel.text = String("Test: \(model.tests!)")
        todayCasesLabel.text = String("Cases: \(model.todayCases!)")
        todatDeathLabel.text = String("Death: \(model.todayDeaths!)")
    }
    
    
    func setupViewConstarints() {
        
        addSubview(countryFlag)
        countryFlag.translatesAutoresizingMaskIntoConstraints = false
        countryFlag.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        countryFlag.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        countryFlag.widthAnchor.constraint(equalToConstant: 80).isActive = true
        countryFlag.heightAnchor.constraint(equalToConstant: 80).isActive = true
        countryFlag.backgroundColor = .red
        
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: countryFlag.trailingAnchor, constant: 10).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 140).isActive = true
        containerView.backgroundColor = .blue
        
        containerView.addSubview(countryLabel)
        countryLabel.translatesAutoresizingMaskIntoConstraints = false
        countryLabel.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        countryLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5).isActive = true
        
        containerView.addSubview(continentLabel)
        continentLabel.translatesAutoresizingMaskIntoConstraints = false
        continentLabel.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 5).isActive = true
        continentLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        
        containerView.addSubview(casesLabel)
        casesLabel.translatesAutoresizingMaskIntoConstraints = false
        casesLabel.topAnchor.constraint(equalTo: continentLabel.bottomAnchor).isActive = true
        casesLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        
        containerView.addSubview(deathLabel)
        deathLabel.translatesAutoresizingMaskIntoConstraints = false
        deathLabel.topAnchor.constraint(equalTo: casesLabel.bottomAnchor).isActive = true
        deathLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        
        containerView.addSubview(activeLabel)
        activeLabel.translatesAutoresizingMaskIntoConstraints = false
        activeLabel.topAnchor.constraint(equalTo: deathLabel.bottomAnchor).isActive = true
        activeLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        
        containerView.addSubview(testLabel)
        testLabel.translatesAutoresizingMaskIntoConstraints = false
        testLabel.topAnchor.constraint(equalTo: activeLabel.bottomAnchor).isActive = true
        testLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        
        containerView.addSubview(todayLabel)
        todayLabel.translatesAutoresizingMaskIntoConstraints = false
        todayLabel.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        todayLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true

        containerView.addSubview(todayCasesLabel)
        todayCasesLabel.translatesAutoresizingMaskIntoConstraints = false
        todayCasesLabel.topAnchor.constraint(equalTo: todayLabel.bottomAnchor).isActive = true
        todayCasesLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true

        containerView.addSubview(todatDeathLabel)
        todatDeathLabel.translatesAutoresizingMaskIntoConstraints = false
        todatDeathLabel.topAnchor.constraint(equalTo: todayCasesLabel.bottomAnchor).isActive = true
        todatDeathLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        
    }
}
