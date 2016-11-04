//
//  LeeBannerModel.swift
//  GiftShow
//
//  Created by admin on 16/8/9.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit

class LeeBannerModel: LeeBaseModel {

    var ad_monitors:[String]?
    var channel:String?
    var id:NSNumber?
    var image_url:String?{
        didSet{
          if let url = image_url {
          imageURL = URL(string: url)
          }
        }
    }
    
    var imageURL:URL?
    var order:NSNumber?
    var status:NSNumber?
    var target_id:NSNumber?
    var target_type:NSNumber?
    var target_url:String?
    var type:NSNumber?
    var webp_url:String?
    var target:[String:AnyObject]?
    
    init(dict:[String:AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
//    static func loadBanner(finished:(modals:[LeeBannerModel]?,error:NSError?)->()){
//        let dict = ["channel":"iOS"]
//        LeeGiftNetworkTool.shareInstance() .GET("v2/banners", parameters: dict, success: { (_, JSON) ->Void in
//         //转换成模型
//        
//            var dd = JSON["data"]! as! [String:AnyObject]
//            let array = dd["banners"]  as! [[String : AnyObject]]
//            let arrs =    Json2Modal(array)
//            finished(modals: arrs,error:nil)
//            
//        }) { (_, error) -> Void in
//            finished(modals: nil,error: error)
//        }
//
//    }

//    class func Json2Modal(lists:[[String:AnyObject]]) -> [LeeBannerModel]{
//        var arr = [LeeBannerModel]() //初始化一个数组
//        for dict in lists{
//            arr .append(LeeBannerModel(dict: dict))
//        }
//        return arr
//    }
    
}
