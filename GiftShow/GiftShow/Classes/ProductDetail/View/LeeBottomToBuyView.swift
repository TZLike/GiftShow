//
//  LeeBottomToBuyView.swift
//  GiftShow
//
//  Created by admin on 16/11/3.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit

class LeeBottomToBuyView: UIView {

    class func getInfo()->LeeBottomToBuyView {
    
         return Bundle.main.loadNibNamed("LeeBottomToBuyView", owner: nil, options: nil)?.first as! LeeBottomToBuyView
    }

}
