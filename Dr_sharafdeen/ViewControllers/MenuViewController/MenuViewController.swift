//
//  MenuViewController.swift
//  Dr_sharafdeen
//
//  Created by Ibraheem Thaqafee on 26/10/2020.
//  Copyright © 2020 Ibraheem Thaqafee. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView?
    private var menus = ["Home", "Artist",  "Albums"]
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
        cell.updateCell(menuName: self.menus[indexPath.item])
        return cell
    }
}
