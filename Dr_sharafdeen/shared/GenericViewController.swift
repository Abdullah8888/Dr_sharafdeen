//
//  GenericView.swift
//  Dr_sharafdeen
//
//  Created by Ibraheem Thaqafee on 28/09/2020.
//  Copyright © 2020 Ibraheem Thaqafee. All rights reserved.
//

import Foundation
import UIKit

class GenericViewController: UIViewController {
    func buildNavigationBar() {
        self.navigationController?.navigationBar.barTintColor = UIColor(hex: "E92C19")
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        leftView.backgroundColor = .clear
        //leftView.layer.borderWidth = 2
        
        let menuImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 27, height: 30))
        let barMenu = UIImage(named: "bar_menu")
        menuImageView.isUserInteractionEnabled = true
        let tapBar = UITapGestureRecognizer(target: self, action: #selector(self.showMenus(_:)))
        tapBar.numberOfTapsRequired = 1
        menuImageView.addGestureRecognizer(tapBar)
        menuImageView.image = barMenu
        leftView.addSubview(menuImageView)
        
        let title = UILabel(frame: CGRect(x: 40, y: -10, width: 100, height: 50))
        title.text = "Home"
        title.textAlignment = .center
        title.font = UIFont.boldSystemFont(ofSize: 18)
        //title.layer.borderWidth = 1
        title.textColor = .white
        leftView.addSubview(title)

//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.leftAnchor.constraint(equalTo: leftView.leftAnchor, constant: 20).isActive = true
//        imageView.heightAnchor.constraint(equalTo: leftView.heightAnchor, constant: 10).isActive = true
        let leftBarItem = UIBarButtonItem(customView: leftView)
        self.navigationItem.setLeftBarButton(leftBarItem, animated: true)
        //self.navigationItem.title = "Home"
        
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        rightView.backgroundColor = .clear
        let searchImageView = UIImageView(frame: CGRect(x: 70, y: 0, width: 23, height: 23))
        let searchIcon = UIImage(named: "search_icon")
        searchImageView.isUserInteractionEnabled = true
        let tapSearch = UITapGestureRecognizer(target: self, action: #selector(self.searchText(_:)))
        tapSearch.numberOfTapsRequired = 1
        searchImageView.addGestureRecognizer(tapSearch)
        searchImageView.image = searchIcon
        rightView.addSubview(searchImageView)
        let rightBarItem = UIBarButtonItem(customView: rightView)
        self.navigationItem.setRightBarButton(rightBarItem, animated: true)
        
    }
    
    //MARK: Return to Home Screen
    @objc func showMenus(_ sender: UIButton) {
        debugPrint("working")
        let menuViewController = MenuViewController(nibName: "MenuViewController", bundle: nil)
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true)
    }
    
    @objc func searchText(_ sender: UIButton) {
        //self.navigationController?.navigationItem.rightBarButtonItem.
    }
}

extension GenericViewController: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        SideMenuTransition.sharedInstance.isPresenting = true
        return SideMenuTransition.sharedInstance
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        SideMenuTransition.sharedInstance.isPresenting = false
        return SideMenuTransition.sharedInstance
    }
}
