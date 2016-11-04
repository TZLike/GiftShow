//
//  LeeHotCoverView.swift
//  GiftShow
//
//  Created by admin on 16/10/26.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit

class LeeHotCoverView: UIView {

   
    @IBOutlet weak var coverImageView: UIImageView!

}


extension LeeHotCoverView {

    class func getInfo()->LeeHotCoverView {
    
        return Bundle.main.loadNibNamed("LeeHotCoverView", owner: nil, options: nil)!.first as! LeeHotCoverView
        
    }
}
