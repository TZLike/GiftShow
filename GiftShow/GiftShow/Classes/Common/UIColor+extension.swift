//
//  UIColor+extension.swift
//  SwiftLove
//
//  Created by admin on 16/10/27.
//  Copyright © 2016年 李苛. All rights reserved.
//

import UIKit

extension UIColor {

    class func colorWithCustom(_ r: CGFloat, g:CGFloat, b:CGFloat) -> UIColor {
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1)
    }
    
    class func randomColor() -> UIColor {
        let r = CGFloat(arc4random_uniform(256))
        let g = CGFloat(arc4random_uniform(256))
        let b = CGFloat(arc4random_uniform(256))
        return UIColor.colorWithCustom(r, g: g, b: b)
    }
    
    class func colorWithHexString(_ hex:String)->UIColor{
        
        return colorWithHexString(hex, alpha: 1.0)
    }
    
    class func colorWithHexString(_ hex:String , alpha:CGFloat)->UIColor{
        
        
        //删除字符串中的空格
        
//        var  cString = hex .stringByTrimmingCharactersInSet(NSCharacterSet .whitespaceAndNewlineCharacterSet()).uppercased() as NSString
        
        var cString = hex.uppercased() as NSString
        if (cString.length < 6)
        {
            return UIColor.clear
        }
        
        //        //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
        if (cString .hasPrefix("0X"))
        {
//            cString = cString .substring(from: 2)
            cString = cString.substring(from: 2) as NSString
//            cString = cString.substring(from: )
        }
        //        //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
        if (cString .hasPrefix("#"))
        {
            cString = cString .substring(to: 1)
  as NSString       }
        if (cString.length != 6)
        {
            return UIColor.clear
        }
        
        let rString = cString .substring(to: 2)
        let gString = (cString .substring(from: 2)as NSString) .substring(to: 2)
        let bString = (cString .substring(from: 4)as NSString) .substring(to: 2)
        var r:CUnsignedInt = 0
        var g:CUnsignedInt = 0
        var b:CUnsignedInt = 0
        
        Scanner(string:rString as String).scanHexInt32(&r)
        Scanner(string:gString as String).scanHexInt32(&g)
        Scanner(string:bString as String).scanHexInt32(&b)
        return UIColor(red: (CGFloat(r) / 255.0), green: (CGFloat(g) / 255.0), blue: (CGFloat(b) / 255.0), alpha: 1.0)
    }

}
