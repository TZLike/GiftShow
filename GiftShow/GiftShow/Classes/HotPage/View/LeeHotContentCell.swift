//
//  LeeHotContentCell.swift
//  GiftShow
//
//  Created by admin on 16/8/11.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit
import SDWebImage
import SnapKit
class LeeHotContentCell: UICollectionViewCell {

  
   
    private lazy var backImageView:UIImageView = {
        
        let imageView = UIImageView()
        
        return imageView
    }()
    private lazy var nameLabel:UILabel = {
        let label  = UILabel()
        label.font = UIFont(name: FZLanTingHeiELGBK,size: 12)
        label.textColor = UIColor.colorWithHexString("938688")
        return label
        
    }()
    
    private lazy var textLabel1:UILabel = {
        let label  = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(name: FZLanTingHeiELGBK,size: 12)
        label.textColor = UIColor.colorWithHexString("938688")
        return label
        
    }()
    
    private lazy var priceLabel:UILabel = {
        let label  = UILabel()
        label.font = UIFont(name: FZLanTingHeiELGBK,size: 12)
        label.textColor = UIColor.red
        return label
        
    }()
    
 
    override func awakeFromNib() {
        super.awakeFromNib()
       
        
//        price.font = UIFont(name: FZLanTingHeiELGBK,size: 12)
//        text.font = UIFont(name: FZLanTingHeiELGBK,size: 12)
//        
        
    }
  
    
    
    fileprivate func makeUI(){
        
       //添加子控件
         contentView.addSubview(backImageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(textLabel1)
        contentView.addSubview(priceLabel)
        backImageView.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(contentView)
            make.height.equalTo(HEIGHT * 0.26)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(contentView).offset(10)
            make.right.equalTo(contentView).offset(-10)
            make.top.equalTo(backImageView.snp.bottom).offset(3)
            make.height.equalTo(15)
        }
        
        textLabel1.snp.makeConstraints { (make) in
            make.left.equalTo(contentView).offset(10)
            make.right.equalTo(contentView).offset(-10)
            make.top.equalTo(nameLabel.snp.bottom).offset(3)
            make.height.equalTo(20)
        }
        priceLabel.snp.makeConstraints { (make) in
            make.left.equalTo(contentView).offset(10)
            make.right.equalTo(contentView).offset(-10)
            make.top.equalTo(textLabel1.snp.bottom).offset(3)
            make.height.equalTo(20)
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 3
        makeUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var model:LeeHotModel?{
        didSet{
         
            priceLabel.text = String(format: "￥%.2f",model?.price ?? 0 )
            textLabel1.text = model?.short_description
            backImageView.sd_setImage(with: model?.cover_image_URL, placeholderImage: UIImage(named: "comment_placeholder"))
            nameLabel.text = model?.name
            
            
        }
        
    }
    
    var  listModel:LeeCateSingleListModel?{
        didSet{
         
//            topLabel.hidden = true
              backImageView.sd_setImage(with: listModel?.cover_image_URL, placeholderImage: UIImage(named: "comment_placeholder"))
             priceLabel.text = String(format: "￥%.2f",listModel?.price ?? 0 )
            textLabel1.text = listModel?.name
            
          
        }
    }

}
