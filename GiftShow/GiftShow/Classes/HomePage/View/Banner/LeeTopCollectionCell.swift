//
//  LeeTopCollectionCell.swift
//  GiftShow
//
//  Created by admin on 16/8/10.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
// 精选顶部Cell

import UIKit
import SDWebImage
class LeeTopCollectionCell: UICollectionViewCell {

    @IBOutlet weak var imageIcon: UIImageView!
    var model:LeeBannerModel?{
        didSet{
          imageIcon.sd_setImage(with: model?.imageURL,placeholderImage: UIImage(named: "comment_placeholder"))
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }

}
