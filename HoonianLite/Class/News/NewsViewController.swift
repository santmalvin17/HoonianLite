//
//  NewsViewController.swift
//  HoonianLite
//
//  Created by Gregory Kevin on 19/07/20.
//  Copyright © 2020 Malvin Santoso. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    enum NewsCellList {
        case image
        case title
        case content
    }

    @IBOutlet weak var tableView: UITableView!
    
    var sections = [NewsCellList]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configTable()
        configSections()
    }
    override func viewDidAppear(_ animated: Bool) {
        configNavigation()
    }
    
    func configNavigation() {
        detectAdaptiveClass()
        backStyleNavigationController(pageTitle: "NEWS", isLeftLogoHide: "", isLeftSecondLogoHide: "")
    }

    
    func configTable() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "NewsImageTableViewCell", bundle: nil), forCellReuseIdentifier: "newsImageTableViewCell")
        tableView.register(UINib(nibName: "NewsTitleTableViewCell", bundle: nil), forCellReuseIdentifier: "newsTitleTableViewCell")
        tableView.register(UINib(nibName: "NewsContentTableViewCell", bundle: nil), forCellReuseIdentifier: "newsContentTableViewCell")
        tableView.register(UINib(nibName: "NewsLabelTableViewCell", bundle: nil), forCellReuseIdentifier: "NewsLabelTableViewCellID")
    }

    func configSections() {
        sections.append(.image)
        sections.append(.title)
        sections.append(.content)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch sections[section] {
        case .image:
            return 1
        case .title:
            return 1
        case .content:
            return ACData.NEWSDETAILMODEL.content.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch sections[indexPath.section] {
        case .image:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "newsImageTableViewCell", for: indexPath) as? NewsImageTableViewCell)!
            cell.detailObj = ACData.NEWSDETAILMODEL
            return cell
        case .title:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "newsTitleTableViewCell", for: indexPath) as? NewsTitleTableViewCell)!
            cell.detailObj = ACData.NEWSDETAILMODEL
            return cell
        case .content:
            let cell = (tableView.dequeueReusableCell(withIdentifier: "NewsLabelTableViewCellID", for: indexPath) as? NewsLabelTableViewCell)!
            cell.position = indexPath.row
            cell.detailObj = ACData.NEWSDETAILMODEL
            return cell
        }
    }
    
}
