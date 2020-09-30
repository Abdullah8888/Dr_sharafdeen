//
//  LoginViewController.swift
//  Dr_sharafdeen
//
//  Created by Ibraheem Thaqafee on 21/09/2020.
//  Copyright © 2020 Ibraheem Thaqafee. All rights reserved.
//

import UIKit
import SwiftyJSON
class LoginViewController: UIViewController {

    @IBOutlet weak var signUpLabel: UILabel?
    @IBOutlet weak var radioBtn: UIButton?
    var isRememberMe: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.radioBtn?.layer.cornerRadius = (self.radioBtn?.layer.frame.width)! / 2
        self.radioBtn?.layer.borderWidth = 2.0 //D1D1D6
        self.radioBtn?.layer.borderColor = UIColor(hex: "D1D1D6").cgColor
        
        let tapSignUp = UITapGestureRecognizer(target: self, action: #selector(self.signUp(_:)))
        tapSignUp.numberOfTapsRequired = 1
        self.signUpLabel?.addGestureRecognizer(tapSignUp)
    }

    override func viewWillLayoutSubviews() {
       
    }
    
    @objc func signUp(_ sender: UITapGestureRecognizer) {
        let vc = RegistrationViewController(nibName: "RegistrationViewController", bundle: nil)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.rootViewController = UINavigationController(rootViewController: vc)
        appDelegate.window?.rootViewController = vc
       }

    @IBAction func rememberBtn(_ sender: Any) {
        if self.isRememberMe == false {
            self.radioBtn?.backgroundColor = UIColor.lightGray
            self.isRememberMe = true
        }
        else {
            self.radioBtn?.backgroundColor = UIColor.white
            self.isRememberMe = false
        }
        
    }
    
    
    @IBAction func skip(_ sender: UIButton) {
        let vc = MainViewController(nibName: "MainViewController", bundle: nil)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.rootViewController = UINavigationController(rootViewController: vc)
        appDelegate.window?.rootViewController = appDelegate.rootViewController
        debugPrint("the list is \(self.navigationController?.viewControllers)")
    }
    
    
}


