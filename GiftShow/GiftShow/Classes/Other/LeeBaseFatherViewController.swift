//
//  LeeBaseFatherViewController.swift
//  GiftShow
//
//  Created by admin on 16/10/21.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
// 控制器的父类

import UIKit

class LeeBaseFatherViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default .addObserver(self, selector: #selector(LeeBaseFatherViewController.toLogin), name: NSNotification.Name(rawValue: unLogin), object: nil)

    }

    deinit {
      NotificationCenter.default .removeObserver(self)
    }
    
    @objc fileprivate func toLogin(){
      
        
        let login = LeeLoginViewController()
        
        self .present(login, animated: true, completion: nil)
        
    }
    


}
