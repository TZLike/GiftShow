//
//  LeeCateSingleListModel.swift
//  GiftShow
//
//  Created by admin on 16/10/28.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit

class LeeCateSingleListModel: LeeBaseModel {

    
    var category_id :NSNumber = 0
    var cover_image_url:String?{
        didSet{
            if let cover_image_url = cover_image_url {
              cover_image_URL = URL(string: cover_image_url)
            }
        }
    }
    var cover_image_URL:URL?
    var des:String? //描述
    var favorites_count:NSNumber = 0
    var image_urls:[String]?
    var name:String?
    var price:CGFloat = 0.0
    var purchase_id:NSNumber = 0
    var purchase_shop_id:NSNumber = 0
    var url:String?
    var webp_urls:[String]?
    
    init(dict:[String:NSObject]) {
        
        super.init()
        setValuesForKeys(dict)
    }
    
//    override func setValue(value: AnyObject?, forKey key: String) {
//        
//        if let key = "description" {
//          self.des = value
//        }
//     
//    }
    
    
    
    
    
}
