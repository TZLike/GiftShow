//
//  LeeCotentModel.swift
//  GiftShow
//
//  Created by admin on 16/8/10.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
// 这是精选模型

import UIKit

class LeeCotentModel: LeeBaseModel {

    var ad_monitors:[String]?
    //字典类型
    var author:[String:NSObject]?{
        didSet{
            guard let authors = author else {return }
            
            myAuthor = LeeAuthor(dict:authors)
           
        }
    }
    //字典类型
    var column:[String:NSObject]?{
        didSet{
            guard let column = column else {return }
            
            myColumn = LeeColumn(dict:column)
        }
    }
    var introduction:String? {
        didSet{
            if let ins = introduction {
             
                let textY:CGFloat = 310
                //文本的高度
                let maxSize = CGSize(width: UIScreen.main.bounds.width - 20,height: CGFloat(MAXFLOAT))
                let textString = ins as NSString
                let textH = textString.boundingRect(with: maxSize, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName : UIFont.systemFont(ofSize: 13)], context: nil).size.height
                guard textH == 0.0 else {  cellHeight = textH + textY  +  30
                    return }
                cellHeight = textH + textY - 20
            }
        }
    }
    var myColumn:LeeColumn? //分类
    var myAuthor:LeeAuthor? //作者
    var cellHeight:CGFloat = 0.0
    var content_type:NSNumber?
    var content_url:String?
    var cover_webp_url:String?
    var cover_image_url:String?{
        didSet{
            if let url = cover_image_url {
              cover_image_URL = URL(string: url)
            }
        }
    }
    var created_at:NSNumber?
    var likes_count:NSNumber?
    var share_msg:String?
    var title:String?
    var url:String?
    var cover_image_URL:URL?
    
    init(dict:[String:AnyObject]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forKey key: String) {
        
//        if "author" == key {
//            
//            author = LeeAuthor(dict:value as! [String:AnyObject])
//            return
//        }
//        
//        if "column" == key {
//        
//            if  value != nil{
//            column = LeeColumn(dict:value as! [String:AnyObject])
//                return
//            }
//        }
        super.setValue(value, forKey: key)
    }
    
//    static func loadBanner(finished:(modals:[LeeCotentModel]?,error:NSError?)->()){
//        let dit = ["ad":"2","gender":"2","generation":"2","limit":"20","offset":"0"]
//        LeeGiftNetworkTool.shareInstance().GET("v2/channels/104/items_v2", parameters: dit, success: { (_, JSON) in
//            
//            var dd = JSON["data"]! as! [String:AnyObject]
//            let array = dd["items"]  as! [[String : AnyObject]]
//            
//         
//            let arrs =    Json2Modal(array)
//            finished(modals: arrs,error:nil)
//            
//            
//        }) { (_, error) in
//            finished(modals: nil,error:error)
//        }
//
//        
//    }
//    //转换成模型数组
//    
//    class func Json2Modal(lists:[[String:AnyObject]]) -> [LeeCotentModel]{
//        var arr = [LeeCotentModel]() //初始化一个数组
//        for dict in lists{
//            arr .append(LeeCotentModel(dict: dict))
//        }
//        return arr
//    }
}
