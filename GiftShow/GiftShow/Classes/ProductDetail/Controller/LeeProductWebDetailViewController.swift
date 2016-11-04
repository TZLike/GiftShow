//
//  LeeHotCategoryViewController.swift
//  GiftShow
//
//  Created by admin on 16/10/26.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit

class LeeProductWebDetailViewController: UIViewController {
    

       var rank:NSNumber = 0
    var html:String?{
        didSet{
          self.myWebView.loadHTMLString(html!, baseURL: nil)
            
        }
    }
    
    private lazy var topView:UIView = {
    
        let view = UIView()
        view.frame = CGRect(x:0,y:-10,width:WIDTH,height:30)
        view.backgroundColor = UIColor.white
        return view
    }()
    private lazy var myWebView:UIWebView = {
     
        let webView = UIWebView()
        webView.frame =  CGRect(x:0,y:40,width:WIDTH,height:HEIGHT - 50)
        webView.backgroundColor = UIColor.clear
        return webView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
     view.backgroundColor = UIColor.colorWithHexString("f9f5f4")
       view.addSubview(topView)
       view.addSubview(myWebView)
    }
    
}






