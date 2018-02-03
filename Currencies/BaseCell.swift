//
//  BaseCell.swift
//  Currencies
//
//  Created by Leon on 02/02/2018.
//  Copyright © 2018 Leon. All rights reserved.
//

import UIKit
import Foundation

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        backgroundColor = .blue
    }
}
