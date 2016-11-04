//
//  LeeMiddleBannerModel.swift
//  GiftShow
//
//  Created by admin on 16/8/10.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit

class LeeMiddleBannerModel: LeeBaseModel {

    var  ad_monitors:[String]?
    var id:NSNumber?
    var target_url:String?
    var webp_url:String?
    var image_url:String?{
        didSet{
            if let url = image_url {
                imageURL = URL(string: url)
            }
        }
    }
     var imageURL:URL?
    init(dict:[String:NSObject]) {
        super.init()
        
        setValuesForKeys(dict)
    }

    
  
}
