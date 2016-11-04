//
//  LeeBaseModel.swift
//  GiftShow
//
//  Created by admin on 16/8/10.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit

class LeeBaseModel: NSObject {

    override func setValue(_ value: Any?, forKey key: String) {
        
        super.setValue(value, forKey: key)
    }
    //防止崩溃
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
