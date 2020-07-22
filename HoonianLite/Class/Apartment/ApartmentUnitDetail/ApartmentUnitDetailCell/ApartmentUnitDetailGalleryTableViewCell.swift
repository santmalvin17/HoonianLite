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
    var scrollWidth = UIScreen.main.bounds.width
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
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = (collectionView?.contentOffset.x)!/scrollWidth
        pageControl?.currentPage = Int(page)

    }
    
}

extension ApartmentUnitDetailGalleryTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ACData.UNITDETAILMODEL.projectTypeDetail.gallery.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "ApartmentUnitDetailGalleryCollectionViewCellID", for: indexPath) as? ApartmentUnitDetailGalleryCollectionViewCell)!
        cell.detailObj = ACData.UNITDETAILMODEL.projectTypeDetail.gallery[indexPath.row]
        return cell
    }
    
    
}
