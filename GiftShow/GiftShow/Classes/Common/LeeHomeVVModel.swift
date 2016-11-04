//
//  LeeHomeVVModel.swift
//  GiftShow
//
//  Created by admin on 16/10/25.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit

class LeeHomeVVModel: NSObject {

    
    fileprivate var homeModels:[LeeCotentModel] = [LeeCotentModel]() //首页底部的数据
    fileprivate var cycelModels:[LeeBannerModel] = [LeeBannerModel]() //顶部轮播图数据
    //加载中间的数据
    fileprivate var  middleModels:[LeeMiddleBannerModel] = [LeeMiddleBannerModel]()
    
    //榜单页面banner数据
    fileprivate var hotBanner:[LeeHotBannerModel] = [LeeHotBannerModel]()
    
    //榜单数据
    
    fileprivate var hotMainModel:LeeHotMainModel?
    

    
    
}

extension LeeHomeVVModel {

    //加载首页底部数据
    func requstHome(_ finished:@escaping (_ arrs:[LeeCotentModel]?,_ error:NSError?)->()) {
       self.homeModels.removeAll()
       let dit = ["ad":"2","gender":"2","generation":"2","limit":"20","offset":"0"]
        LeeGiftNetworkTool.shareInstance().get("v2/channels/104/items_v2", parameters: dit, success: { (_, result) in
             guard let result = result as? [String:NSObject] else {return }
            guard let  resultDic = result["data"] as? [String:NSObject] else {return }
            guard let dataArray = resultDic["items"] as? [[String:NSObject]] else {return}
            for dd in dataArray {
             
                let model = LeeCotentModel(dict:dd)
                self.homeModels.append(model)
            }
            //将数据返回
            finished(self.homeModels,nil)
            
            })
    
    }
    
    
    
    //加载首页轮播图片
    func requestHomeCycle(_ finised:@escaping (_ arrs:[LeeBannerModel]?,_ error:NSError?)->()) {
      self.cycelModels.removeAll()
        let dict = ["channel":"iOS"]
        
        LeeGiftNetworkTool.shareInstance().get("v2/banners", parameters: dict
            , success: { (_, result) in
                
//                guard let resultDic = result["data"] as? [String:NSObject] else {return}
                
                guard let result = result as? [String:NSObject] else {return }
                
                guard let resultDic = result["data"] as? [String:NSObject] else {return}
                
                
                guard let dataArray = resultDic["banners"] as? [[String:NSObject]] else {return}
                
                for dd in dataArray {
                    let model = LeeBannerModel(dict:dd)
                    self.cycelModels.append(model)
                }
                
                finised(self.cycelModels,nil)
        })
    
    }
    
    
    
    //加载首页中间的数据
    func requestMiddle(_ finished:@escaping (_ arrs:[LeeMiddleBannerModel]?,_ error:NSError?)->()){
     
       
        let dit = ["gender":"2","generation":"2"]
        LeeGiftNetworkTool.shareInstance().get("v2/secondary_banners", parameters: dit, success: { (_, result) in
             guard let result = result as? [String:NSObject] else {return }
            
            guard let resultDict = result["data"] as? [String:NSObject] else {return}
            guard let dataArray = resultDict["secondary_banners"] as? [[String:NSObject]] else {return }
            
            for dd in dataArray {
                
                let model = LeeMiddleBannerModel(dict:dd)
                self.middleModels.append(model)
            }
            
            finished(self.middleModels,nil)
            
            
        })

    }
    
    
    
    //加载榜单标题数据
    func requetHotBanner(_ finished:@escaping (_ arrs:[LeeHotBannerModel]?,_ error:NSError?)->()) {
    
        LeeGiftNetworkTool.shareInstance().get("http://api.liwushuo.com/v2/ranks_v2/ranks?", parameters: nil, success: { (_, result) in
            
             guard let result = result as? [String:NSObject] else {return }
            
            guard let resultDict   = result["data"] as? [String:NSObject] else {return }
            guard let dataArray = resultDict["ranks"] as? [[String:NSObject]] else {return }
            for dd in dataArray {
              
                let model = LeeHotBannerModel(dict:dd)
                self.hotBanner.append(model)
            }
            
            finished(self.hotBanner,nil)
            
            })
        }

    

    //加载分类攻略页面数据
    func requestCateData(_ finished:@escaping (_ arrs:[LeeCategoryModel]?,_ error:NSError?)->()) {

        LeeGiftNetworkTool.shareInstance().get("http://api.liwushuo.com/v2/channel_groups/all?", parameters: nil, success: { (_, result) in
            // //分类
            guard let result = result as? [String:NSObject] else {return }
            
            guard let resultDict = result["data"] as? [String:NSObject] else {return }
            guard let dataArray = resultDict["channel_groups"] as? [[String:NSObject]] else {return }
             var categoryModels:[LeeCategoryModel] = [LeeCategoryModel]()
             for  dd in dataArray {
                let model = LeeCategoryModel(dict:dd)
                categoryModels .append(model)
            }
            
              finished(categoryModels,nil)
            
        })

}

   //加载分类攻略顶部数据
    func requestCateTopData(_ fininshed:@escaping (_ arrs:[LeeTopCategoryModel]?,_ error:NSError?)->()) {
        let dict = ["limit":"11","offset":"0"]
        LeeGiftNetworkTool.shareInstance().get("http://api.liwushuo.com/v2/columns", parameters: dict, success: { (_, result) in
             guard let result = result as? [String:NSObject] else {return }
            
            guard let resultDict = result["data"] as? [String:NSObject] else {return }
            guard let dataArray = resultDict["columns"] as? [[String:NSObject]] else {return }
            var arrs:[LeeTopCategoryModel] = [LeeTopCategoryModel]()
            
            for dd in dataArray {
                let model = LeeTopCategoryModel(dict:dd)
                arrs.append(model)
                
            }
            
            fininshed(arrs,nil)
           
              })
}
    
    //加载单品数据
    func requestSingleData(_ finished:@escaping (_ arr:[LeeSingleModel]?,_ error:NSError?)->()) {
     
        LeeGiftNetworkTool.shareInstance().get("http://api.liwushuo.com/v2/item_categories/tree?", parameters: nil, success: { (_, result) in
            
             guard let result = result as? [String:NSObject] else {return }
            
            guard let resultDict = result["data"] as? [String:NSObject] else {return }
            
            
            guard let dataArray = resultDict["categories"] as? [[String:NSObject]]else {return}
           
            var arrs:[LeeSingleModel] = [LeeSingleModel]()
            
            //转化成模型数据
            for dd in dataArray{
                let model = LeeSingleModel(dict:dd)
                arrs.append(model)
            }
        
            finished(arrs,nil)
            
            })
}
    
    //加载单品列表
    
    func requestSingleListData(_ cateId:()->NSNumber,getType:()->sortViewLoadType, finished:@escaping (_ arrs:[LeeCateSingleListModel]?,_ error:NSError?)->()) {
       
        let num =  cateId()
        
        let type = getType()
        
        
        let httpUrl = "http://api.liwushuo.com/v2/item_subcategories/\(num)/items"
       
        var dict = [String:Any]()
        if type == sortViewLoadType.defaultType {
           dict = ["limit":"20","offset":"0"]
        }else if type == sortViewLoadType.hotType {
          dict = ["limit":"20","offset":"0","sort":"hot"]
        }
        else {
           dict = ["limit":"20","offset":"0"]
        }
        LeeGiftNetworkTool.shareInstance().get(httpUrl, parameters: dict, success: { (_, result) in
            
            guard let result = result as? [String:NSObject] else {return }
            guard let resultDict = result["data"] as? [String:NSObject] else {return }
            guard let dataArray = resultDict["items"]as? [[String:NSObject]] else {return }
            
            var arr:[LeeCateSingleListModel] = [LeeCateSingleListModel]()
            
            for dd in dataArray{
                let model = LeeCateSingleListModel(dict:dd)
                arr.append(model)
            }
            finished(arr,nil)
            
            })
       
    }
    
    //加载榜单数据
    func requestHotData(_ rank:()->NSNumber,finished:@escaping (_ model:LeeHotMainModel?,_ error:NSError?)->()){
        
        let rank  = rank()
        let httpUrl = "http://api.liwushuo.com/v2/ranks_v2/ranks/\(rank)"
        let dict = ["limit":"20","offset":"0"]
        LeeGiftNetworkTool.shareInstance().get(httpUrl, parameters: dict, success: { (_, result) in
            
            guard let result = result as? [String:NSObject] else {return }
            
            guard let resultDict = result["data"] as? [String:NSObject] else {return }
            
            let  hotModel = LeeHotMainModel(dict:resultDict)
            finished(hotModel,nil)
            
            
        })
        
        
    }
    
    func requestProductDetail(id:()->NSNumber,finished:@escaping (_ model:LeeListDetailModel?,_ error:NSError?)->()) {
         let num = id()
         let httpUrl = "http://api.liwushuo.com/v2/items/\(num)?"
         LeeGiftNetworkTool.shareInstance().get(httpUrl, parameters:nil, success: { (_, result) in
            guard let result = result as? [String:NSObject] else {return }
            guard let resultDict = result["data"] as? [String:NSObject] else {return }
            let  hotModel = LeeListDetailModel(dict:resultDict)
            finished(hotModel,nil)
        })
     
    }

    
}

