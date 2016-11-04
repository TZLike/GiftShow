//
//  LeeBaseViewController.swift
//  GiftShow
//
//  Created by admin on 16/10/21.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit
//自定义tabbar
class LeeBaseViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.tintColor = UIColor.red
        //主页
    
        createChileViewController(LeeHomeViewController(), titleLable: "首页", normalImage:"tab_icon_home_default", seletedImage: "tab_icon_home_Select")
        //热门
          createChileViewController(LeeHotViewController(), titleLable: "榜单", normalImage:"tab_btn_list_default", seletedImage: "tab_btn_list_select")
        //分类
         createChileViewController(LeeCategoryViewController(), titleLable: "分类", normalImage:"tab_btn_sort_default", seletedImage: "tab_btn_sort_select")
        //我
         createChileViewController(LeeMeViewController(), titleLable: "我的", normalImage:"tab_btn_mine_default", seletedImage: "tab_btn_mine_select")
    }

   
    
    // MARK:创建子控制器
    /**
       这是创建控制器
     
     - parameter vc:           控制器
     - parameter titleLable:   标题
     - parameter normalImage:  正常图片
     - parameter seletedImage: 选中图片
     */
    fileprivate func createChileViewController(_ vc:UIViewController,titleLable:String,normalImage:String,seletedImage:String){
     
        vc.tabBarItem.title = titleLable
        vc.tabBarItem.image = UIImage(named: normalImage)
        vc.tabBarItem.selectedImage = UIImage(named: seletedImage)
        let nav = LeeNavgationController(rootViewController: vc)
        addChildViewController(nav)
    }

}
