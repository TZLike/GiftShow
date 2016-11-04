//
//  LeeProductDetailReusable.swift
//  GiftShow
//
//  Created by admin on 16/11/3.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit

class LeeProductDetailReusable: UICollectionReusableView {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    var model:LeeListDetailModel?{
        didSet{
            priceLabel.text = String(format: "￥%.f",model?.price ?? 0 )
            countLabel.text = String(format: "%d",model?.likes_count ?? 0 )
            topTitle.text = model?.short_description
            contentLabel.text = model?.des
            nameLabel.text = model?.name
        }
    }
    
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var topTitle: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    
}
