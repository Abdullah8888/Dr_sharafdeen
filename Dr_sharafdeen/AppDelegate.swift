//
//  AppDelegate.swift
//  Dr_sharafdeen
//
//  Created by Ibraheem Thaqafee on 21/09/2020.
//  Copyright © 2020 Ibraheem Thaqafee. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

     var window: UIWindow?
     var rootViewController: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let loginController = LoginViewController(nibName: "LoginViewController", bundle: nil)
        rootViewController = UINavigationController(rootViewController: loginController)
        self.window?.rootViewController = loginController
        
        //self.window?.rootViewController?.navigationController?.navigationBar.bounds = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 20.0)

        self.window?.makeKeyAndVisible()
        return true
    }


}

//extension UINavigationBar {
//    public override func sizeThatFits(_ size: CGSize) -> CGSize {
//        return CGSize(width: frame.width, height: 70)
//    }
//}


