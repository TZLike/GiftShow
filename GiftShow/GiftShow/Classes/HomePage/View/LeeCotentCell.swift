//
//  LeeCotentCell.swift
//  GiftShow
//
//  Created by admin on 16/8/10.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit
import SDWebImage
class LeeCotentCell: UITableViewCell {

    
    @IBOutlet weak var count: UIButton!
    @IBOutlet weak var bigText: UILabel!
    @IBOutlet weak var textContent: UILabel!
    @IBOutlet weak var bigImage: UIImageView! //大图
    @IBOutlet weak var userName: UILabel!
    //用户名称
    @IBOutlet weak var headImage: UIImageView! //用户头像
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var cateGoryLabel: UILabel! //类别
    
    @IBOutlet weak var smallLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    
        headImage.layer.cornerRadius = 10
        headImage.clipsToBounds = true
        userName.font = UIFont(name: FZLanTingHeiELGBK,size: 12)
        cateGoryLabel.font = UIFont(name: FZLanTingHeiELGBK,size: 12)
        titleLabel.font = UIFont(name: FZLanTingHeiELGBK,size: 12)
        
    }
    var model:LeeCotentModel?{
        didSet{
         
            let author = model?.myAuthor
            
            if author != nil {
                userName.text = author?.nickname
                 headImage.sd_setImage(with: author?.imageURL as URL!)
            }
            
//            bigImage.sd_setImageWithURL(model?.cover_image_URL)
            bigImage.sd_setImage(with: model?.cover_image_URL, placeholderImage: UIImage(named:"placeholderimage_big"))
            bigText.text = model?.title
//            let num = NSNumberFormatter()
//            let string = num.stringFromNumber((model?.likes_count)!)
//           count .setTitle(string, forState:.Normal)
            guard let col =  model?.myColumn else {
                cateGoryLabel.isHidden = true
                titleLabel.isHidden = true
                return
            }
            smallLabel.text = col.title
            cateGoryLabel.text = col.category
            textContent.text = model?.introduction
            titleLabel.isHidden = false
            cateGoryLabel.isHidden = false
    
        }
    }
    
    
    var oldFrame:CGRect?
    override var frame:CGRect{
        get {
            return super.frame
        }
        set {
            //  防止 重复减少
            if oldFrame == frame {
                return
            }
            var newFrame = frame
            
            newFrame.origin.x = 1
            newFrame.size.width -= 2
            newFrame.origin.y += 5
            newFrame.size.height -= 10
            oldFrame = newFrame
            super.frame = newFrame
        }
    }
}
