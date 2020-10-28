//
//  shared.swift
//  Dr_sharafdeen
//
//  Created by Ibraheem Thaqafee on 27/09/2020.
//  Copyright © 2020 Ibraheem Thaqafee. All rights reserved.
//

import Foundation
import UIKit
//UIColor from a hex value
extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}

//extension UIImage {
//func maskWithColor(color: UIColor) -> UIImage? {
//
//    let maskImage = self.cgImage
//    let width = self.size.width
//    let height = self.size.height
//    let bounds = CGRectMake(0, 0, width, height)
//
//    let colorSpace = CGColorSpaceCreateDeviceRGB()
//    let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.PremultipliedLast.rawValue)
//    let bitmapContext = CGBitmapContextCreate(nil, Int(width), Int(height), 8, 0, colorSpace, bitmapInfo.rawValue) //needs rawValue of bitmapInfo
//
//    CGContextClipToMask(bitmapContext, bounds, maskImage)
//    CGContextSetFillColorWithColor(bitmapContext, color.CGColor)
//    CGContextFillRect(bitmapContext, bounds)
//
//    //is it nil?
//    if let cImage = CGBitmapContextCreateImage(bitmapContext) {
//        let coloredImage = UIImage(CGImage: cImage)
//
//        return coloredImage
//
//    } else {
//        return nil
//    }
// }
//}

extension UIImage {
    func imageWithColor(color: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        color.setFill()

        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: 0, y: self.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        context?.setBlendMode(CGBlendMode.normal)

        let rect = CGRect(origin: .zero, size: CGSize(width: self.size.width, height: self.size.height))
        context?.clip(to: rect, mask: self.cgImage!)
        context?.fill(rect)

        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        return newImage!
    }
}
