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
    
    //    MARK: INIT
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViewConstarints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        
    }
}
