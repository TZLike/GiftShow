//
//  LeeCateMoreBtnCell.swift
//  GiftShow
//
//  Created by admin on 16/10/27.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit

class LeeCateMoreBtnCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        moreBtn.layer.borderWidth = 1
        moreBtn.layer.borderColor = UIColor.red.cgColor
    }

    @IBAction func moreBtnClick(_ sender: UIButton) {
    }
    @IBOutlet weak var moreBtn: UIButton!
}
