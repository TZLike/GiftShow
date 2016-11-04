//
//  AppDelegate.swift
//  GiftShow
//
//  Created by admin on 16/11/4.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = LeeBaseViewController()
        window?.makeKeyAndVisible()
        return true
    }

 

   


}

