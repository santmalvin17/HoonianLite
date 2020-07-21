//
//  NewsContentTableViewCell.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 19/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class NewsContentTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        tableView.delegate = self
        tableView.dataSource = self
        configCell()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func configCell(){
        tableView.register(UINib(nibName: "NewsLabelTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsLabelTableViewCellID")
    }
    

}

extension NewsContentTableViewCell: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ACData.NEWSDETAILMODEL.content.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "NewsLabelTableViewCellID", for: indexPath) as? NewsLabelTableViewCell)!
        cell.position = indexPath.row
        cell.detailObj = ACData.NEWSDETAILMODEL
        return cell
    }
    
    
}
