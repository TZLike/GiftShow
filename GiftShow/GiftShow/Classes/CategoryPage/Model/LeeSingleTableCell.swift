//
//  LeeSingleTableCell.swift
//  GiftShow
//
//  Created by admin on 16/10/27.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit

class LeeSingleTableCell: UITableViewCell {

    @IBOutlet weak var cateLabel: UILabel!

    @IBOutlet weak var lineView: UIView!
    var model:LeeSingleModel?{
        didSet{

            cateLabel?.text = model?.name
        }
    }
   
    override func awakeFromNib() {
        super.awakeFromNib()
 
        cateLabel?.textColor = UIColor.colorWithHexString("dc6066")

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.contentView.backgroundColor = selected ? UIColor.white : UIColor.groupTableViewBackground
        if(selected){
            cateLabel!.textColor =  UIColor.colorWithHexString("ed462f")

        }else {
            cateLabel!.textColor = UIColor.colorWithHexString("5c5c5c")
      
        }
        lineView.isHidden = !selected
    }
    
}
