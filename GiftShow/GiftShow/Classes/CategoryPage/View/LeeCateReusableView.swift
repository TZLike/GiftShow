//
//  LeeCateReusableView.swift
//  GiftShow
//
//  Created by admin on 16/10/26.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

fileprivate func <= <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l <= r
  default:
    return !(rhs < lhs)
  }
}


class LeeCateReusableView: UICollectionReusableView {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var model:LeeCategoryModel?{
        didSet{
          cateLabel.text = model?.name
            if model?.channels?.count <= 6 {
             moreBtn.isHidden = true
            }else {
             moreBtn.isHidden = false 
            }
        }
    }
    @IBOutlet weak var moreBtn: UIButton!
    @IBOutlet weak var cateLabel: UILabel!
}
