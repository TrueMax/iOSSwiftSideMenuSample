//
//  CentralViewController.swift
//  iOS Swift 2.2 Side Menu Sample
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
