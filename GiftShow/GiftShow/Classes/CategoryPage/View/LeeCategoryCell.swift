//
//  LeeCategoryCell.swift
//  GiftShow
//
//  Created by admin on 16/10/26.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit

class LeeCategoryCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        backImageView.layer.cornerRadius = 2
        backImageView.clipsToBounds = true
    }

    @IBOutlet weak var backImageView: UIImageView!
    
    var model:LeeChannerModel?{
        didSet{
         
            backImageView.sd_setImage(with: model?.cover_image_URL, placeholderImage: UIImage(named: "comment_placeholder"))
        }
    }
}
