//
//  LeeChannerModel.swift
//  GiftShow
//
//  Created by admin on 16/10/26.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//  攻略数据模型

import UIKit

class LeeChannerModel: LeeBaseModel {
    
    var cover_image_url:String?{
        didSet{
            if let cover_image_url = cover_image_url {
                cover_image_URL = URL(string: cover_image_url)
            }
        }
    }
    var group_id:NSNumber = 0
    var icon_url:String?
    var id:NSNumber = 0
    var name:String?
    var order:NSNumber = 0
    var status:NSNumber = 0
    var cover_image_URL:URL?
    init(dict:[String:NSObject]) {
        super.init()
        setValuesForKeys(dict)
    }

}
