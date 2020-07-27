//
//  MoreViewController.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 27/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configCollection()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        configNavigation()
    }

    func configNavigation() {
        detectAdaptiveClass()
        backStyleNavigationController(pageTitle: "More", isLeftLogoHide: "", isLeftSecondLogoHide: "")
    }

    func configCollection() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "MoreSettingsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MoreSettingsCollectionViewCellID")
        collectionView.register(UINib(nibName: "MoreCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "MoreCollectionReusableViewID")
    }

}

extension MoreViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func indexTitles(for collectionView: UICollectionView) -> [String]? {
        return ["Settings"]
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "MoreCollectionReusableViewID", for: indexPath) as? MoreCollectionReusableView{
            if indexPath.section == 0 {
                sectionHeader.sectionHeaderLabel.text = "Settings"
            }

            return sectionHeader
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ACData.LOGINDATA.accessList[0].menus.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "MoreSettingsCollectionViewCellID", for: indexPath) as? MoreSettingsCollectionViewCell)!
        cell.configCell(indexPath: indexPath.row)
        
        return cell
    }
}
