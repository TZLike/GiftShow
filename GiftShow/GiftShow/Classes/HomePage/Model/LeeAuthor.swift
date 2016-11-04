//
//  LeeAuthor.swift
//  GiftShow
//
//  Created by admin on 16/8/10.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit

class LeeAuthor: LeeBaseModel {

    var avatar_url:String?{
        didSet{
            if let url = avatar_url {
              imageURL = URL(string: url)
            }
        }
    }
    var avatar_webp_url:String?
    var created_at:NSNumber?
    var id:NSNumber?
    var nickname:String?
    var imageURL:URL?
    init(dict:[String:NSObject]) {
        super.init()
        setValuesForKeys(dict)
    }
  
  
}
