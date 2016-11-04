//
//  UIImageView+extension.swift
//  GiftShow
//
//  Created by admin on 16/10/21.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit

extension UIImage{
    
    class func imageWithColor(_ color:UIColor)->UIImage{
     
        let imageW = 100
        let imageH = 100
        //开启图片上下文
        UIGraphicsBeginImageContextWithOptions(CGSize(width: imageW,height: imageH), false, 0)
        //画一个color颜色的矩形块
        color.set()
        UIRectFill(CGRect(x: 0,y: 0,width: imageW,height: imageH))
        //拿到图片
        let image:UIImage  = UIGraphicsGetImageFromCurrentImageContext()!
        //关闭上下文
        UIGraphicsEndImageContext()
        return image
        
    }
 
}
