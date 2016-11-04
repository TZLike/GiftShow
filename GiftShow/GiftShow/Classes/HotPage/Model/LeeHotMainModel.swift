//
//  LeeHotMainModel.swift
//  GiftShow
//
//  Created by admin on 16/10/26.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit

class LeeHotMainModel: LeeBaseModel {

    var cover_image:String?{
        didSet{
            if let cover_image = cover_image {
              
                cover_imageURl = URL(string: cover_image)
            }
        }
    }
    var items:[[String:NSObject]]?{
        didSet{
            guard let items = items else {return }
            
            
            for dd in items {
                let model = LeeHotModel(dict:dd)
                models.append(model)

            }
            
        }
    }
    
    var cover_imageURl:URL?
    var models:[LeeHotModel] = [LeeHotModel]()
    
    init(dict:[String:NSObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
}
