//
//  PurchaseDetailUnitImageTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 22/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class PurchaseDetailUnitImageTableViewCell: UITableViewCell {

    @IBOutlet weak var unitNameLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    var carouselCounter = 0
    var countSlideChange = 0
    var timer = Timer()
    var imageToday: [String] = []
    
    @IBOutlet weak var pageControler: UIPageControl!
    var scrollWidth = UIScreen.main.bounds.width
    var scrollHeight = UIScreen.main.bounds.height
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.delegate = self
        collectionView.dataSource = self
        config()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(){
        scrollWidth = collectionView.frame.width
        scrollHeight = collectionView.frame.height
        
                collectionView.register(UINib(nibName: "PurchaseDetailUnitCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PurchaseDetailUnitCollectionViewCellID")
        for index in 0 ..< ACData.PURCHASEDETAILMODEL.purchaseDetailData.projectData.projectUnitType.gallery.count {
            imageToday.append(ACData.PURCHASEDETAILMODEL.purchaseDetailData.projectData.projectUnitType.gallery[index].link)
        }
        self.timer = Timer.scheduledTimer(timeInterval: 3.25, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        changeImage()
        
        pageControler.numberOfPages = imageToday.count
        pageControler.currentPage = 0
    }
    var detailObj: ProjectPurchasedData? {
        didSet {
            cellConfig()
        }
    }
    func cellConfig() {
    guard let obj = detailObj else { return }
        unitNameLabel.text = obj.projectData.projectUnitType.name
        sizeLabel.text = "Size: \(obj.projectData.projectUnitType.size)"
        priceLabel.text = "Price: Rp \(obj.price)"
    }
    
        @objc func changeImage(){
            if carouselCounter >= imageToday.count {
                carouselCounter = 0
            }
            setIndicatorForCurrentPage()
            sliderUpadte()
            countSlideChange += 1
            
        }
        
        func sliderUpadte(){
            let index = IndexPath.init(item: carouselCounter, section: 0)
            self.collectionView?.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            carouselCounter += 1
        }
        
        func setIndicatorForCurrentPage() {
    //        let page = (collectionView?.contentOffset.x)!/scrollWidth
    //        pageControl?.currentPage = carouselCounter
            if carouselCounter >= imageToday.count {
                pageControler.currentPage = 0
            }
            else {
                pageControler.currentPage = carouselCounter
            }
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let page = (collectionView?.contentOffset.x)!/scrollWidth
            pageControler?.currentPage = Int(page)

        }

    
}

extension PurchaseDetailUnitImageTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ACData.PURCHASEDETAILMODEL.purchaseDetailData.projectData.projectUnitType.gallery.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "PurchaseDetailUnitCollectionViewCellID", for: indexPath) as? PurchaseDetailUnitCollectionViewCell)!
        cell.imageView.sd_setImage(
            with: URL(string: (ACData.PURCHASEDETAILMODEL.purchaseDetailData.projectData.projectUnitType.gallery[indexPath.row].link)),
            placeholderImage: UIImage(named: "Collection Logo"),
            options: .refreshCached
        )
        
        return cell
    }
    
    
}
