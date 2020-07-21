//
//  ApartmentUnitDetailGalleryTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 21/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class ApartmentUnitDetailGalleryTableViewCell: UITableViewCell {

    @IBOutlet weak var galleryLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        config()
        configCollection()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config() {
        collectionView.layer.masksToBounds = true
        collectionView.layer.cornerRadius = 5
    }
    
    func configCollection() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "ApartmentUnitDetailGalleryCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ApartmentUnitDetailGalleryCollectionViewCellID")
    }
    
}

extension ApartmentUnitDetailGalleryTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "ApartmentUnitDetailGalleryCollectionViewCellID", for: indexPath) as? ApartmentUnitDetailGalleryCollectionViewCell)!
        
        return cell
    }
    
    
}
