//
//  ContainerViewController.swift
//  Migration Center Bastion
//
//  Created by Maxim on 31.03.16.
//  Copyright © 2016 Maxim. All rights reserved.
//

import UIKit

enum PanelCurrentPosition {
    case SideMenuClosed
    case SideMenuOpen
}

class ContainerViewController: UIViewController, CentralViewControllerDelegate {
    
    var centerNavigationController: UINavigationController!
    var centralViewController: CentralViewController!
    var currentMenuPosition: PanelCurrentPosition = .SideMenuClosed
    var sideMenuViewController: SideMenuViewController?
    
    var panelOffset: CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        centralViewController = UIStoryboard.centralPanelViewController()
        centralViewController.delegate = self
        
        centerNavigationController = UINavigationController(rootViewController: centralViewController)
        view.addSubview(centerNavigationController.view)
        addChildViewController(centerNavigationController)
        centerNavigationController.didMoveToParentViewController(self)
        
    }
    
    //MARK: CentralViewControllerDelegate methods
    func openSideMenu() {
        let menuHidden = currentMenuPosition != .SideMenuOpen
        if menuHidden {
            addSideMenu()
        }
        moveSideMenu(menuHidden)
    }
    
    func openCentralViewController() {
        switch currentMenuPosition {
        case .SideMenuOpen:
            openSideMenu()
        default:
            break
        }
    }
    

    //MARK: SideMenu moving InOut
    func addSideMenu() {
        if sideMenuViewController == nil {
            sideMenuViewController = UIStoryboard.sidePanelViewController()
            addChildSideMenuController(sideMenuViewController!)
        }
        
    }
    
    func addChildSideMenuController (sideMenuController: SideMenuViewController) {
        view.insertSubview(sideMenuController.view, atIndex: 0)
        addChildViewController(sideMenuController)
        sideMenuController.didMoveToParentViewController(self)
    }
    
    func moveSideMenu (shallMove: Bool) {
        if shallMove {
            currentMenuPosition = .SideMenuOpen
            animateCentralPanel(CGRectGetWidth(centerNavigationController.view.frame) - panelOffset)
            
        } else {
            animateCentralPanel(0) {
                finished in
                self.currentMenuPosition = .SideMenuClosed
                self.sideMenuViewController!.view.removeFromSuperview()
                self.sideMenuViewController = nil
            }
        }
    }
    
    func animateCentralPanel(targetPosition: CGFloat, completion: ((Bool) -> Void)! = nil) {
        UIView.animateWithDuration(0.7, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .CurveEaseInOut, animations: {self.centerNavigationController.view.frame.origin.x = targetPosition}, completion: completion)
    }
}


private extension UIStoryboard {
    class func mainStoryboard() -> UIStoryboard { return UIStoryboard(name: "Main", bundle: NSBundle.mainBundle()) }
    
    class func sidePanelViewController() -> SideMenuViewController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier("SideMenuViewController") as? SideMenuViewController
    }
    
    class func centralPanelViewController() -> CentralViewController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier("CentralViewController") as? CentralViewController
    }
    
}