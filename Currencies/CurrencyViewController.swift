//
//  CurrencyViewController.swift
//  Currencies
//
//  Created by Leon on 03/02/2018.
//  Copyright © 2018 Leon. All rights reserved.
//

import UIKit

class CurrencyViewController: UIViewController {

    var currency: Currency!
    
    let ratesLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        navigationItem.title = "MYR/\(currency.name)"
        
        view.addSubview(ratesLabel)
        
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: ratesLabel)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: ratesLabel)
        
        ratesLabel.text = "1 MYR = \(currency.rate) \(currency.name) \n1 \(currency.name) = \(1/currency.rate) MYR"
    }

}
