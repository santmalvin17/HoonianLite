//
//  HomeContentTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 19/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

protocol HomeContentTableViewCellDelegate {
    func selected()
}

class HomeContentTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var delegate: HomeContentTableViewCellDelegate?
    
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
        
        collectionView.register(UINib(nibName: "HomeContentCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "homeContentCollectionViewCell")
    }
    
}

extension HomeContentTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeContentCollectionViewCell", for: indexPath) as? HomeContentCollectionViewCell
        cell!.detailObj = ACData.LOGINDATA.homeData
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.selected()
        print(indexPath.row)
        print(indexPath.section)
    }
    
}
