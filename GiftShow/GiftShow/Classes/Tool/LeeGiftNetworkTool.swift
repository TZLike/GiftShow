//
//  LeeGiftNetworkTool.swift
//  GiftShow
//
//  Created by admin on 16/10/23.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit
import AFNetworking
class LeeGiftNetworkTool: AFHTTPSessionManager {

    private static var __once: () = { () -> Void in
            //baseURL一定要带/
            let url = URL(string: "http://api.liwushuo.com/")
            instance = LeeGiftNetworkTool(baseURL: url)
            //设置AFN能够接受的数据类型
            instance?.responseSerializer.acceptableContentTypes = NSSet(objects: "application/json","text/json","text/javascript","text/plain") as? Set<String>
        }()

    //在swfit中，类方法中是不允许定义静态变量的
    static var once_t:Int = 0
    static var instance:LeeGiftNetworkTool?
    //获取单例
    class func shareInstance() -> LeeGiftNetworkTool {
        _ = LeeGiftNetworkTool.__once
        
        return instance!
    }
}
