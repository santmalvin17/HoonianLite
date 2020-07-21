//
//  LocationListViewController.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 20/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class LocationListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        configCollection()
    }


    func configCollection() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "LocationListCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "locationListCollectionViewCell")
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let itemWidth = UIScreen.main.bounds.width / 2 - 15
            let itemHeight = itemWidth * 3 / 4
            layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
            layout.invalidateLayout()
        }
    }

}

extension LocationListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "locationListCollectionViewCell", for: indexPath) as? LocationListCollectionViewCell)!
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = LocationDetailViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
