//
//  LeeTopCategoryModel.swift
//  GiftShow
//
//  Created by admin on 16/10/27.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit

class LeeTopCategoryModel: LeeBaseModel {

    
    var author:String?
    var banner_image_url:String?
    var  category:String?
    var cover_image_url:String?{
        didSet{
        if let cover_image_url = cover_image_url {
          cover_image_URL = URL(string: cover_image_url)
        }
        }
    }
    var cover_image_URL:URL?
    var title:String?
    var id:NSNumber = 0
    
    init(dict:[String:NSObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    
    
}
