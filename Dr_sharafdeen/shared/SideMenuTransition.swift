//
//  SideMenuTransition.swift
//  Dr_sharafdeen
//
//  Created by Ibraheem Thaqafee on 26/10/2020.
//  Copyright © 2020 Ibraheem Thaqafee. All rights reserved.
//

import Foundation
import UIKit

class SideMenuTransition: NSObject, UIViewControllerAnimatedTransitioning {
    var isPresenting = false
    static let sharedInstance = SideMenuTransition()
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to),
            let fromViewController = transitionContext.viewController(forKey: .from) else { return }
        
        let containerView = transitionContext.containerView
        let finalWidth = fromViewController.view.bounds.width * 0.8
        let finalHeight = fromViewController.view.bounds.height
        
        
        if isPresenting {
            // Add the Menu View to the Container
            containerView.addSubview(toViewController.view)
            //Init frame off the screen , i.e the Menu View will be at -x off the screen
            toViewController.view.frame = CGRect(x: -finalWidth, y: 0.0, width: finalWidth, height: finalHeight)
            //fromViewController.view.translatesAutoresizingMaskIntoConstraints = false
//            toViewController.view.translatesAutoresizingMaskIntoConstraints = false
//            if #available(iOS 11.0, *) {
//                toViewController.view.topAnchor.constraint(equalTo: fromViewController.view.safeAreaLayoutGuide.topAnchor, constant: 20.0).isActive = true
//            } else {
//                // Fallback on earlier versions
//                debugPrint("ios version lesser than 11.0")
//            }
        }
        
        //Animate on to the screen i.e slide in
        let transform = {
            toViewController.view.transform = CGAffineTransform(translationX: finalWidth, y: 0)
            fromViewController.view.alpha = 2
            print("1")
        }
        
        //Animate back off the screen, i.e slide out
        let identity = {
            fromViewController.view.transform = .identity
            print("2")
        }
        
        let duration = transitionDuration(using: transitionContext)
        print("the duration is \(duration)")
        let isCancelled = transitionContext.transitionWasCancelled
        UIView.animate(withDuration: duration, animations: {
            if self.isPresenting {
                transform()
                fromViewController.view.alpha = 0.4
                fromViewController.view.isHidden = false
            }
            else {
                identity()
                toViewController.view.alpha = 1.0
            }
        }) {    (_) in
            transitionContext.completeTransition(!isCancelled)
        }
    }
}
