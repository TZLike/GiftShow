//
//  LeeHotBannerModel.swift
//  GiftShow
//
//  Created by admin on 16/10/26.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit

class LeeHotBannerModel: LeeBaseModel {

    
    var id:NSNumber = 0 //标题id
    var mark_style:NSNumber = 0
    var name:String?
    var title:String? //显示标题
    var update_at:NSNumber = 0
    init(dict:[String:NSObject]) {
        super.init()
        setValuesForKeys(dict)
        
    }
}
