//
//  LeeMiddleBannerCell.swift
//  GiftShow
//
//  Created by admin on 16/8/10.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit

class LeeMiddleBannerCell: UICollectionViewCell {

    var model:LeeMiddleBannerModel? {
     
        didSet{
            imageIcon.sd_setImage(with: model?.imageURL,placeholderImage: UIImage(named: "logo"))
        }
        
    }
    @IBOutlet weak var imageIcon: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
       backgroundColor = UIColor.clear
        imageIcon.layer.cornerRadius = 7
        
        imageIcon.clipsToBounds = true
    
        
    }

}
