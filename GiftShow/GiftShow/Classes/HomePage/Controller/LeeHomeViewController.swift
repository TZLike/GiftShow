//
//  LeeHomeViewController.swift
//  GiftShow
//
//  Created by admin on 16/11/4.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
// 主页

import UIKit
private let titleHeight:CGFloat = 44
class LeeHomeViewController: UIViewController {

   
    fileprivate lazy var cusView:LeeHomeSearchView = {
        
        let view = LeeHomeSearchView.getInfo()
        view.backgroundColor = UIColor.colorWithHexString("FDF5F3").withAlphaComponent(0.8)
        view.frame = CGRect(x: 50, y: 20, width: WIDTH - 105, height: 30)
        view.layer.cornerRadius = 15
        view.delegate = self
        view.clipsToBounds = true
        return view
        
    }()
    //MARK:懒加载数据
    fileprivate lazy var dataArray:[String] = {
        return ["精选", "送男票", "穿搭", "海淘", "礼物", "美护", "送闺蜜", "送爸妈", "送基友", "送同事", "送宝贝", "创意生活", "手工","设计感","文艺风"]
    }()
    //MARK:加载分类数据
    
    fileprivate lazy var channels:[Int]  = {
        return [104,9,110,129,111,113,5,6,26,17,24,125,3,127,14]
    }()
    
    //上面的banner
    fileprivate lazy var topBanner:LeeHomeBannerView = {[weak self] in
        
        let topBanner = LeeHomeBannerView(frame:CGRect(x: 0, y: 0, width: WIDTH,height: titleHeight),arrs:(self?.dataArray)!)
        topBanner.delegate = self
        topBanner.backgroundColor = UIColor.white
        return topBanner
        }()
   
    
    //底部的数据控件
    
    fileprivate lazy var bottomView:LeeHomeBottomView = {
        
        var arr:[UIViewController] = [UIViewController]()
        
        let wonderful = LeeHomeWonderfulViewController()
        wonderful.channels = self.channels[0]
       arr.append(wonderful)
        
        for i in 0..<self.dataArray.count - 1 {
            
            let other = LeeHomeOtherViewController()
            other.channels = self.channels[i + 1]
             arr.append(other)
        }

        let view = LeeHomeBottomView(frame:CGRect(x: 0,y: titleHeight + 1, width: WIDTH, height: HEIGHT),vcs:arr,parent:self)
        view.delegate = self
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
       automaticallyAdjustsScrollViewInsets = false
        view.backgroundColor = UIColor.white
         view.addSubview(topBanner)
        view.addSubview(bottomView)
        setupNav()
    }
    
    fileprivate func setupNav(){
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.leftBarButtonItem = UIBarButtonItem.createBarButtonItem("jingxuan_navi_left", highlitedImageName: "jingxuan_navi_left", target: self, sel: #selector(LeeHomeViewController.leftItemClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageNormal: "btn_remind",seletedImage: "btn_remind",target: self ,sel: #selector(self.rightItemClick),size: CGSize.zero)
        
        navigationItem.titleView = self.cusView
        
    }
    
    //右侧导航条点击
    @objc func rightItemClick(){
        
    }
    
    //左侧导航条点击
    
    func leftItemClick(){
        
        //暂时测试发送未登录通知
        NotificationCenter.default .post(name: Notification.Name(rawValue: unLogin), object: nil)
    }
    
}


//MARK:改变title的触摸
extension LeeHomeViewController : LeeHomeBannerViewDelegate {
    
    func hotTopTitleClick(_ hot: LeeHomeBannerView, index: Int) {
        
        self.bottomView.changePageControler(index)
    }
}
//MARK:改变collectionView的页码
extension LeeHomeViewController :LeeHomeBottomViewDelegate {
    
    func scrollContentIndex(_ pageContent: LeeHomeBottomView, progress: CGFloat, targetIndex: Int, sourceIndex: Int) {
        topBanner.showProgress(progress, targetInex: targetIndex, sourceIndex: sourceIndex)
    }
}

extension LeeHomeViewController : LeeHomeSearchViewDelegate {
    
    func searchBtnClick() {
        
       
    }
}
