//
//  LeeColumn.swift
//  GiftShow
//
//  Created by admin on 16/8/10.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit

class LeeColumn: LeeBaseModel {

    
    var banner_image_url:String?
    var category:String?
    var cover_image_url:String?
    var created_at:NSNumber?
    var description1:String?
    var id:NSNumber?
    var order:NSNumber?
    var post_published_at:NSNumber?
    var status:NSNumber?
    var title:String?
    var subtitle:String?
   
    var updated_at:NSNumber?
    
    init(dict:[String:AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    
    override func setValue(_ value: Any?, forKey key: String) {
        
        if "description" == key {
         
            self.description1 = value as? String
        }
        super.setValue(value , forKey: key)
    }
    
}
