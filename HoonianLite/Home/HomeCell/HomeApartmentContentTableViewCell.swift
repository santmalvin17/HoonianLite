//
//  HomeApartmentContentTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 20/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

protocol HomeApartmentContentTableViewCellDelegate {
    func homeApartmentSelected()
}

class HomeApartmentContentTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var delegate: HomeApartmentContentTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configCollection()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configCollection() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "HomeApartmentCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "homeApartmentCollectionViewCell")
    }
    
}

extension HomeApartmentContentTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "homeApartmentCollectionViewCell", for: indexPath) as? HomeApartmentCollectionViewCell)!
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.homeApartmentSelected()
    }
    
}
