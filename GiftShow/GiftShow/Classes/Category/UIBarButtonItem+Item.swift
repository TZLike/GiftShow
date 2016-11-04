//
//  UIBarButtonItem+Item.swift
//  GiftShow
//
//  Created by admin on 16/10/21.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//
import UIKit

extension UIBarButtonItem {
 
    //在swift中如果方法前面加上一个class 这个方法就是个类方法
    class func createBarButtonItem(_ imageName:String , highlitedImageName:String,target:AnyObject?,sel:Selector)-> UIBarButtonItem{
        
        let btn = UIButton()
        btn.setImage(UIImage(named:imageName), for: UIControlState())
        btn.setImage(UIImage(named:highlitedImageName), for: UIControlState.highlighted)
        btn .addTarget(target, action: sel, for: UIControlEvents.touchUpInside)
        btn .sizeToFit()
        return UIBarButtonItem(customView: btn)
        
    }
    
    //便利构造函数以convenience开头，但是要在构造函数中要明确调用一个设计的构造函数
    convenience init(imageNormal:String , seletedImage:String = "",target:AnyObject,sel:Selector,size :CGSize = CGSize.zero) {
        
        
        let btn = UIButton()
        btn.setImage(UIImage(named:imageNormal), for: UIControlState())
        if seletedImage != "" {
        btn.setImage(UIImage(named:seletedImage), for: UIControlState.highlighted)
        }
        btn .addTarget(target, action: sel, for: UIControlEvents.touchUpInside)
        
        if size != CGSize.zero {
         btn.frame = CGRect(origin: CGPoint.zero,size: size)
        }else {
        btn .sizeToFit()
        }
       
        self.init(customView:btn)
        
    }
}
