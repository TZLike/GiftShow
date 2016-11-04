//
//  LeeHomeSearchView.swift
//  GiftShow
//
//  Created by admin on 16/10/25.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit

protocol  LeeHomeSearchViewDelegate : class  {
    
    func searchBtnClick()
}
class LeeHomeSearchView: UIView {

    weak var delegate:LeeHomeSearchViewDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    //搜索按钮点击
    @IBAction func searchBtnClick(_ sender: UIButton) {
        delegate?.searchBtnClick()
    }
}

extension  LeeHomeSearchView {

    class func getInfo()->LeeHomeSearchView {
    
        return Bundle.main.loadNibNamed("LeeHomeSearchView", owner: nil, options: nil)!.first as! LeeHomeSearchView
    }
}
