//
//  LeeCategoryModel.swift
//  GiftShow
//
//  Created by admin on 16/10/26.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit

class LeeCategoryModel: LeeBaseModel {

    var channels:[[String:NSObject]]? {
        didSet{
            guard let  chh = channels else {return }
            
            for dd in chh {
                let model = LeeChannerModel(dict:dd)
                channers.append(model)
            }
        }
    }
    var id:NSNumber = 0
    var name:String?
    var order:NSNumber = 0
    var channers:[LeeChannerModel] = [LeeChannerModel]() //分类
    
    init(dict:[String:NSObject]) {
        super.init()
        setValuesForKeys(dict)
    }
}
