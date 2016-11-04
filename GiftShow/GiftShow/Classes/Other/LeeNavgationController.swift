//
//  LeeNavgationController.swift
//  GiftShow
//
//  Created by admin on 16/10/21.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit

class LeeNavgationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        
        let appearance = UINavigationBar.appearance()
        appearance.isTranslucent = false
        appearance.setBackgroundImage(UIImage.imageWithColor(UIColor.white), for: UIBarMetrics.default)
        var textAttrs: [String : AnyObject] = Dictionary()
        textAttrs[NSForegroundColorAttributeName] = UIColor.black
        textAttrs[NSFontAttributeName] = UIFont.systemFont(ofSize: 17)
        appearance.titleTextAttributes = textAttrs
    }

    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if(childViewControllers.count > 0){ //如果push进来的不是第一个控制器
            
            let button = UIButton(type: UIButtonType.custom)
            button .setTitle("返回", for: UIControlState())
            
            button .setImage(UIImage(named:"navigationButtonReturn"), for: UIControlState())
            button .setImage(UIImage(named:"navigationButtonReturnClick"), for: UIControlState.highlighted)
            
            button.size = CGSize(width: 70, height: 30)
            //让按钮内部的所有内容左对齐
            button.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
            button.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
            button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
            
            button .setTitleColor(UIColor.black, for: UIControlState())
            
            button .setTitleColor(UIColor.red, for: UIControlState.highlighted)
            button .addTarget(self, action: #selector(LeeNavgationController.back), for: UIControlEvents.touchUpInside)
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
            //使得下面的tabbar消失
            viewController.hidesBottomBarWhenPushed = true;
            
        }
        //这句调用super的代码要放在后面
    
        super.pushViewController(viewController, animated: animated)
    }
    
    func back(){
        popViewController(animated: true)
    }
    
}
