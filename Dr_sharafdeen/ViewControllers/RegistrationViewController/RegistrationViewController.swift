//
//  RegistrationViewController.swift
//  Dr_sharafdeen
//
//  Created by Ibraheem Thaqafee on 27/09/2020.
//  Copyright © 2020 Ibraheem Thaqafee. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    //@IBOutlet weak var bottomLayout: NSLayoutConstraint?
    @IBOutlet weak var loginLabel: UILabel?
    @IBOutlet weak var userName: UITextField?
    @IBOutlet weak var userEmail: UITextField?
    @IBOutlet weak var userPassword: UITextField?
    @IBOutlet weak var confirmPassword: UITextField?
    @IBOutlet weak var phoneNumber: UITextField?
    override func viewDidLoad() {
        super.viewDidLoad()
        let userIcon = UIImage(named: "user_reg")
        let emailIcon = UIImage(named: "user_email_icon")
        let passwordIcon = UIImage(named: "user_pass_icon")
        let confirmPasswordIcon = UIImage(named: "user_pass_icon")
        let phoneIcon = UIImage(named: "phone_icon")
        self.addLeftImageToTextField(userName!, userIcon!)
        self.addLeftImageToTextField(userEmail!, emailIcon!)
        self.addLeftImageToTextField(userPassword!, passwordIcon!)
        self.addLeftImageToTextField(confirmPassword!, confirmPasswordIcon!)
        self.addLeftImageToTextField(phoneNumber!, phoneIcon!)
        
        let tapLogin = UITapGestureRecognizer(target: self, action: #selector(self.login(_:)))
        tapLogin.numberOfTapsRequired = 1
        self.loginLabel?.addGestureRecognizer(tapLogin)
        debugPrint("the width is \(UIScreen.main.bounds.width)")
//        if UIScreen.main.bounds.width > 500 {
//            self.bottomLayout?.constant = -50
//        }
    }
    
    func addLeftImageToTextField(_ textField: UITextField, _ img: UIImage) {
        textField.layer.borderWidth = 0.0
        textField.borderStyle = .none
        let imageView = UIImageView(frame: CGRect(x: 3, y: 5, width: 24, height: 24))
        imageView.image = img
        imageView.contentMode = .scaleAspectFit
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 32, height: 40))
        view.addSubview(imageView)
        textField.leftView = view
        textField.leftViewMode = .always
    }
    
    @objc func login(_ sender: UITapGestureRecognizer) {
     let vc = LoginViewController(nibName: "LoginViewController", bundle: nil)
     let appDelegate = UIApplication.shared.delegate as! AppDelegate
     appDelegate.rootViewController = UINavigationController(rootViewController: vc)
     appDelegate.window?.rootViewController = vc
     debugPrint("the list is \(self.navigationController?.viewControllers)")
    }
}
