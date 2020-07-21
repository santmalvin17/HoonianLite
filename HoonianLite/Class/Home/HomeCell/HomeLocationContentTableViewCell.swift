//
//  HomeLocationContentTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 20/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

protocol HomeLocationContentTableViewCellDelegate {
    func homeLocationSelected(indexKe: Int)
}

class HomeLocationContentTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var delegate: HomeLocationContentTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configCollection()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCollection() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "HomeLocationCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "homeLocationCollectionViewCell")
    }
    
}

extension HomeLocationContentTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ACData.LOGINDATA.homeData.cities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "homeLocationCollectionViewCell", for: indexPath) as? HomeLocationCollectionViewCell)!
        cell.position = indexPath.row
        cell.detailObj = ACData.LOGINDATA.homeData
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.homeLocationSelected(indexKe: indexPath.row)
    }
    
}
