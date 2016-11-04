//
//  LeeSingleModel.swift
//  GiftShow
//
//  Created by admin on 16/10/27.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit

class LeeSingleModel: LeeBaseModel {

    
    var icon_url:String?
    var id:NSNumber = 0
    var name:String?
    var order:NSNumber = 0
    var subcategories:[[String:NSObject]]?{
        didSet {
            guard let subcategories = subcategories else {return }
            
            for dd in subcategories {
                let model =  LeeSingleCateModel(dict:dd)
                cates.append(model)
            }
        }
    }
    var cates:[LeeSingleCateModel] = [LeeSingleCateModel]()
    init(dict:[String:NSObject]) {
        super.init()
        setValuesForKeys(dict)
        
    }
}
