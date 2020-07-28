//
//  HomeWarehouseContentTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 20/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

protocol HomeWarehouseContentTableViewCellDelegate {
    func homeWarehouseSelected(indexKe: Int)
}

class HomeWarehouseContentTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var delegate: HomeWarehouseContentTableViewCellDelegate?
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
        
        collectionView.register(UINib(nibName: "HomeWarehouseCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "homeWarehouseCollectionViewCell")
    }
}

extension HomeWarehouseContentTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ACData.LOGINDATA.homeData.wareHouse.projects.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "homeWarehouseCollectionViewCell", for: indexPath) as? HomeWarehouseCollectionViewCell)!
                cell.position = indexPath.row
        cell.detailObj = ACData.LOGINDATA.homeData
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.homeWarehouseSelected(indexKe: indexPath.row)
    }
    
}
