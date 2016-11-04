//
//  Common.swift
//  GiftShow
//
//  Created by admin on 16/10/21.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//



import UIKit
//全局的常量
let WIDTH = UIScreen.main.bounds.size.width
let HEIGHT = UIScreen.main.bounds.size.height
//未登陆通知
let unLogin:String = "toLogin"
let FZLanTingHeiELGBK = "FZLanTingHei-EL-GBK"
//全局的背景色
let NavColor = UIColor(red: 251.0/255.0, green: 45.0/255.0, blue: 71.0/255.0, alpha: 1.0)

let GlobalColor = UIColor(red: 240.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 1.0)

let Color_GlobalLine = UIColor(red: 237.0/255.0, green: 240.0/255.0, blue: 240.0/255.0, alpha: 1.0)


extension UIView {
    
    var x:CGFloat {
        get{
            return self.frame.origin.x
        }
        set{
            self.frame.origin.x = newValue
        }
    }
    
    
    var y:CGFloat{
        get{
            return self.frame.origin.y
        }
        set{
            self.frame.origin.y = newValue
        }
    }
    
    var centerX:CGFloat{
        get{
            return self.frame.midX
        }
        set{
            self.frame.origin.x = newValue - self.frame.size.width * 0.5
        }
    }
    
    var centerY:CGFloat{
        get{
            return self.frame.midY
        }
        set{
            self.frame.origin.y = newValue - self.frame.size.height * 0.5
        }
    }
    
    var width:CGFloat{
        get{
            return self.frame.size.width
        }
        set{
            self.frame.size.width = newValue
        }
    }
    
    var height:CGFloat{
        get{
            return self.frame.size.height
        }
        set{
            self.frame.size.height = newValue
        }
    }
    
    var size:CGSize{
        get{
            return self.frame.size
        }
        set{
            self.frame.size = newValue
        }
    }
}
