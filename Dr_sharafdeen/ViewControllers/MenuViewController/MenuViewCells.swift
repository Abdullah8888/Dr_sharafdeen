//
//  MenuViewCells.swift
//  Dr_sharafdeen
//
//  Created by Ibraheem Thaqafee on 26/10/2020.
//  Copyright © 2020 Ibraheem Thaqafee. All rights reserved.
//

import UIKit

class MenuViewCells: UITableViewCell {

    @IBOutlet weak var menuLbl: UILabel?
    @IBOutlet weak var img: UIImageView?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCell(menuName: String, imageName: String) {
        self.menuLbl?.text = menuName
        let image = UIImage(named: imageName)
        self.img?.image = image
    }
    
    func selectedMenu(){
        self.menuLbl?.textColor = .red
        //self.img?.image.tintColor = .red
        self.img?.image = self.img?.image!.imageWithColor(color: .red)
    }
    
}
