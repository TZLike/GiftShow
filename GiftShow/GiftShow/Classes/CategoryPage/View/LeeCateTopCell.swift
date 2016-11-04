//
//  LeeCateTopCell.swift
//  GiftShow
//
//  Created by admin on 16/10/27.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit

class LeeCateTopCell: UICollectionViewCell {
    @IBOutlet weak var backImageView: UIImageView!

    @IBOutlet weak var authorName: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
      backImageView.layer.cornerRadius = 4
        backImageView.clipsToBounds = true
    }
    
    var model:LeeTopCategoryModel?{
        didSet{
          backImageView.sd_setImage(with: model?.cover_image_URL, placeholderImage: UIImage(named: "comment_placeholder"))
            titleLabel.text = model?.title
            authorName.text = model?.author
            
        }
     }

}
