//
//  SideMenuViewController.swift
//  iOS Swift 2.2 Side Menu Sample
//
//  Created by Maxim on 31.03.16.
//  Copyright © 2016 Maxim. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var delegate: SideMenuViewController?
}

extension SideMenuViewController {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        if indexPath.section == 0 {
        cell = tableView.dequeueReusableCellWithIdentifier("MenuCellSection1", forIndexPath: indexPath)
        } else if indexPath.section == 1 {
        cell = tableView.dequeueReusableCellWithIdentifier("MenuCellSection2", forIndexPath: indexPath)
        }
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var sectionTitle: String!
        if section == 0 {
            sectionTitle = "FIRST SECTION"
        } else if section == 1 {
            sectionTitle = "SECOND SECTION"
        }
        return sectionTitle
    }
    
}

extension SideMenuViewController {
    
}