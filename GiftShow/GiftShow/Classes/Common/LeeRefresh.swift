//
//  LeeRefresh.swift
//  GiftShow
//
//  Created by admin on 16/10/20.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit
import MJRefresh
class LeeRefresh: MJRefreshGifHeader {

    override func prepare() {
        super.prepare()
        
        var idleImages = [UIImage]()
        var pullingImages = [UIImage]()
        var refreshingImages = [UIImage]()
        
        for i in 0...10 {
            idleImages.append(UIImage(named: String(format: "loading_dragdown_%02d", i))!)
        }
        pullingImages.append(UIImage(named: "loading_00")!)
        for i in 0...22 {
            refreshingImages.append(UIImage(named: String(format: "loading_%02d", i))!)
        }
        lastUpdatedTimeLabel.isHidden = true
        stateLabel.isHidden = true
        setImages(idleImages, for: MJRefreshState.idle)
        setImages(pullingImages, for: MJRefreshState.pulling)
        setImages(refreshingImages, for: MJRefreshState.refreshing)
    }


}
