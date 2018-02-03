//
//  CurrencyCollectionViewController.swift
//  Currencies
//
//  Created by Leon on 02/02/2018.
//  Copyright © 2018 Leon. All rights reserved.
//

import UIKit

class CurrencyCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    private let cellId = "cellId"
    
    var currencies = [Currency]()
    
    override func viewDidLoad() {

        collectionView?.backgroundColor = .white
        collectionView?.register(CurrencyCell.self, forCellWithReuseIdentifier: cellId)
        
        navigationItem.title = "Forex Rates"
        
        setupData()
    }
    
    var refreshControl = UIRefreshControl()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl.addTarget(self, action: #selector(refreshPulled), for: .valueChanged)
        self.collectionView?.addSubview(refreshControl)
    }
    
    func refreshPulled() {
        setupData()
    }
    
    func setupData() {
        
        if self.refreshControl.isRefreshing {
            self.refreshControl.endRefreshing()
        }
        
        let currencyLoader = CurrencyLoader()
        currencyLoader.fetchData(baseCurrency: "MYR") { responseObject, error in
            self.currencies.removeAll()
            for object in responseObject! {
                self.currencies.append(object)
            }
            self.collectionView?.reloadData()
        }
    }
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return currencies.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        currencies.sort { $0.name < $1.name }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CurrencyCell
        
        cell.nameLabel.text = currencies[indexPath.item].name
        cell.rateLabel.text = String(currencies[indexPath.item].rate)
        cell.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(currencyTapped)))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: 35)
    }
    
    func currencyTapped(sender: UITapGestureRecognizer) {
        
        let backItem = UIBarButtonItem()
        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
        
        let cell = sender.location(in: self.collectionView)
        let indexPath = self.collectionView?.indexPathForItem(at: cell)
        
        let controller = CurrencyViewController()
        controller.currency = currencies[(indexPath?.item)!]
        self.navigationController?.pushViewController(controller, animated: true)
    }
    
    
}
