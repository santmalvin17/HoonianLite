//
//  HomeUpcomingProjectContentTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 19/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit
import SDWebImage

protocol HomeUpcomingProjectContentTableViewCellDelegate {
    func imageViewPressed(indexKe:Int)
}

class HomeUpcomingProjectContentTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var delegate: HomeUpcomingProjectContentTableViewCellDelegate?
    
    var carouselCounter = 0
    var countSlideChange = 0
    var timer = Timer()
    var imageToday: [String] = []
    
    var scrollWidth = UIScreen.main.bounds.width
    var scrollHeight = UIScreen.main.bounds.height
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        config()
    }
    
    func config() {
        scrollWidth = collectionView.frame.width
        scrollHeight = collectionView.frame.height
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "HomeUpcomingContentCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "homeUpcomingContentCollectionViewCell")
        
        for index in 0 ..< ACData.LOGINDATA.homeData.news.count {
            imageToday.append(ACData.LOGINDATA.homeData.news[index].image)
        }
        
        self.timer = Timer.scheduledTimer(timeInterval: 3.25, target: self, selector: #selector(self.changeImage), userInfo: nil, repeats: true)
        changeImage()
        
        pageControl.numberOfPages = imageToday.count
        pageControl.currentPage = 0
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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
            pageControl.currentPage = 0
        }
        else {
            pageControl.currentPage = carouselCounter
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let page = (collectionView?.contentOffset.x)!/scrollWidth
        pageControl?.currentPage = Int(page)

    }

}

extension HomeUpcomingProjectContentTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ACData.LOGINDATA.homeData.news.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "homeUpcomingContentCollectionViewCell", for: indexPath) as? HomeUpcomingContentCollectionViewCell)!
        cell.imageView.sd_setImage(
            with: URL(string: (ACData.LOGINDATA.homeData.news[indexPath.row].image)),
            placeholderImage: UIImage(named: "School Logo"),
            options: .refreshCached
        )
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.imageViewPressed(indexKe: indexPath.row)
    }
    
    
}
