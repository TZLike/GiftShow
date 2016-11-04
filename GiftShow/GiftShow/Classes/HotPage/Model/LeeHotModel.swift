//
//  LeeHotModel.swift
//  GiftShow
//
//  Created by admin on 16/10/22.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//  热门模型

import UIKit

class LeeHotModel: LeeBaseModel {

    var  ad_monitors:[String]?
    var cover_image_url:String? {
        didSet{
            if let url = cover_image_url {
               cover_image_URL = URL(string: url)
            }
        }
    }
    var short_description:String?
    var cover_image_URL:URL?
    var cover_webp_url:String?
    var created_at:NSNumber?
    var description1:String?
    var editor_id:NSNumber = 0
    var favorites_count:NSNumber = 0
    var id:NSNumber?
    var image_urls:[String]?
    var is_favorite:NSNumber?
    var name:String?
    var price:CGFloat = 0
    var category_id:NSNumber = 0
    init(dict:[String:AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
 
}
