//
//  LeeListDetailModel.swift
//  GiftShow
//
//  Created by admin on 16/11/3.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit

class LeeListDetailModel:LeeBaseModel {
   //描述
    var des:String?
    //网页地址
    var detail_html:String?
    var favorites_count:NSNumber = 0
    var image_urls:[String]?
    var likes_count:NSNumber = 0
    var name:String?
    var price:CGFloat = 0
    var purchase_url:String?
    var short_description:String?
    
    init(dict:[String:NSObject]) {
        
        super.init()
        setValuesForKeys(dict)
    }
    
    
    override func setValue(_ value: Any?, forKey key: String) {
        
                if "description" == key {
                    self.des = value as! String?
        }
        
        super.setValue(value, forKey: key)
    }
    
}
