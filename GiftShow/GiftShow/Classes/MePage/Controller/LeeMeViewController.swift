//
//  LeeMeViewController.swift
//  GiftShow
//
//  Created by admin on 16/10/21.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit

class LeeMeViewController: LeeBaseFatherViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "我的"
        setupUI()
        
    }
    
    //初始化视图
    fileprivate func setupUI(){
        
        hideNavigation(false)
    }
    
    
    
    /**
     *  @author 李苛, 16-08-12
     *
     *  隐藏导航栏
     */
    
    fileprivate  func hideNavigation(_ image:Bool){
        automaticallyAdjustsScrollViewInsets  = false
        navigationController?.navigationBar.isTranslucent = true //设置导航栏透明度
        navigationController?.navigationBar.setBackgroundImage(UIImage(named: "me_profilebackground"), for: UIBarMetrics.default)
        navigationController?.navigationBar.shadowImage = UIImage() //设置导航栏阴影背景
        
    }
    
}
