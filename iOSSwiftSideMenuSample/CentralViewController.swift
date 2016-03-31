//
//  CentralViewController.swift
//  Migration Center Bastion
//
//  Created by Maxim on 31.03.16.
//  Copyright © 2016 Maxim. All rights reserved.
//

import UIKit

protocol CentralViewControllerDelegate {
    func openSideMenu()
    func openCentralViewController()
}


class CentralViewController: UIViewController {
    
    @IBAction func pressMENU(sender: AnyObject) {
        delegate?.openSideMenu()
    }
    
    var delegate: CentralViewControllerDelegate?
}
