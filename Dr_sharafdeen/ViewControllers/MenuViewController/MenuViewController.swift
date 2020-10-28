//
//  MenuViewController.swift
//  Dr_sharafdeen
//
//  Created by Ibraheem Thaqafee on 26/10/2020.
//  Copyright © 2020 Ibraheem Thaqafee. All rights reserved.
//

import UIKit

enum MenuType: Int {
    case home
    case support
    case ourInitiatives
    case share
    case aboutDn
}

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView?
    private var menus = ["Home", "Artist",  "Albums"]
    private var menusImageName = ["home", "artist",  "albums"]
    static var selectedMenuIndex = 0
    var didTapMenu: ((MenuType) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        // Do any additional setup after loading the view.
        self.regesterCell()
    }
    
    func regesterCell() {
        self.tableView?.register(UINib(nibName: "MenuViewCells", bundle: nil), forCellReuseIdentifier: "MenuViewCells")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuViewCells", for: indexPath) as! MenuViewCells
        cell.updateCell(menuName: self.menus[indexPath.item], imageName: self.menusImageName[indexPath.row])
        //cell.backgroundColor = .red
        let dff = UIEdgeInsets(top: 0, left: 0, bottom: 25, right: 0)
        cell.layer.frame.inset(by: dff)
        //cell.layer.borderWidth = 2.0
        if indexPath.item == MenuViewController.selectedMenuIndex {
            cell.selectedMenu()
        }
//        let verticalPadding: CGFloat = 8
//        let maskLayer = CALayer()
//        //maskLayer.cornerRadius = 10    //if you want round edges
//        maskLayer.backgroundColor = UIColor.black.cgColor
//        maskLayer.frame = CGRect(x: cell.bounds.origin.x, y: cell.bounds.origin.y, width: cell.bounds.width, height: cell.bounds.height).insetBy(dx: 0, dy: verticalPadding/2)
//        cell.layer.mask = maskLayer
        return cell
    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return CGFloat(10.0)
//    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(40.0)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        MenuViewController.selectedMenuIndex = indexPath.item
//        guard let menuType = MenuType(rawValue: indexPath.row) else {return}
//        dismiss(animated: true) { [weak self] in
//            SideMenuTransition.sharedInstance.isPresenting = false
//            print("Dismissing: \(menuType)")
//            self?.didTapMenu?(menuType)
//        }
        
        
        let vc = ArtistViewController(nibName: "ArtistViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
//        switch indexPath.item {
//        case 0:
//            print("asd")
//            let vc = MainViewController(nibName: "MainViewController", bundle: nil)
//            //guard let df = self.navigationController?.viewControllers.first else { return  }
//            guard let check = self.navigationController?.viewControllers.last?.isKind(of: MainViewController.classForCoder()) else {return}
//            //dd
//            if check {
//                self.navigationController?.pushViewController((self.navigationController?.viewControllers.last!)!, animated: true)
//            }
//            else {
//                self.navigationController?.pushViewController(vc, animated: true)
//            }
//        case 1:
//            let vc = ArtistViewController(nibName: "ArtistViewController", bundle: nil)
//            self.navigationController?.pushViewController(vc, animated: true)
//        case 2:
//            print("asd")
//        default:
//            print("No page")
//        }
        
//        dismiss(animated: true) {
//            SideMenuTransition.sharedInstance.isPresenting = false
//        }
    }
}
