//
//  CurrencyCell.swift
//  Currencies
//
//  Created by Leon on 02/02/2018.
//  Copyright © 2018 Leon. All rights reserved.
//

import UIKit
import Foundation

class CurrencyCell: BaseCell {

    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "SFUIText-Bold", size: 17)
        return label
    }()
    
    let rateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "SFUIText-Bold", size: 17)
        return label
    }()
    
    let dividerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1)
        return view
    }()
    
    override func setupViews() {
        backgroundColor = .white
        
        addSubview(nameLabel)
        addSubview(rateLabel)
        addSubview(dividerLineView)
        
        addConstraintsWithFormat(format: "H:|-14-[v0][v1]-14-|", views: nameLabel, rateLabel)
        addConstraintsWithFormat(format: "H:|[v0]|", views: dividerLineView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: nameLabel)
        addConstraintsWithFormat(format: "V:|[v0][v1(1)]|", views: rateLabel, dividerLineView)
    }
}
