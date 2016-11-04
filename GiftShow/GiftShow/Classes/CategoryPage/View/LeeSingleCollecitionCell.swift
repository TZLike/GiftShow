//
//  LeeSingleCollecitionCell.swift
//  GiftShow
//
//  Created by admin on 16/10/27.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit

class LeeSingleCollecitionCell: UICollectionViewCell {

    @IBOutlet weak var backImageView: UIImageView!
    
    @IBOutlet weak var cateName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    var model:LeeSingleCateModel?{
        didSet{
            backImageView.sd_setImage(with: model?.icon_URL, placeholderImage: UIImage(named: "comment_placeholder"))
            cateName.text  = model?.name
        }
    }

}
