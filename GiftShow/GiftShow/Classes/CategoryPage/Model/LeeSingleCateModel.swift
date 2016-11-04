//
//  LeeSingleCateModel.swift
//  GiftShow
//
//  Created by admin on 16/10/27.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit

class LeeSingleCateModel: LeeBaseModel {

    
    var icon_url:String?{
        didSet{
            if let icon_url = icon_url {
              icon_URL = URL(string: icon_url)
            }
        }
    }
    var icon_URL:URL?
    var id:NSNumber = 0
    var name:String?
    var parend_id:NSNumber = 0
    var item_count:NSNumber = 0
    
    init(dict:[String:NSObject]) {
        super.init()
        setValuesForKeys(dict)
    }
}
