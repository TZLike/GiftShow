//
//  LeeHotViewController.swift
//  GiftShow
//
//  Created by admin on 16/10/21.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit
import MJRefresh
private let cellReuseIdentifier = "LeeHotCell"
private let titleHeight:CGFloat = 24
class LeeHotViewController: UIViewController {
    
    
    var request:LeeHomeVVModel = LeeHomeVVModel()
    //顶部banner
    var banners:[LeeHotBannerModel]?{
        didSet{
            
            view.addSubview(topBanner)
            view.addSubview(bottomView)
        }
    }
    fileprivate lazy var topBanner:LeeHotTopBanner = {[weak self] in
        
        let topBanner = LeeHotTopBanner(frame:CGRect(x: 0, y: 0, width: WIDTH,height: titleHeight),arrs:self!.banners!)
        topBanner.delegate = self
        topBanner.backgroundColor = UIColor.white
        return topBanner
        }()
    
    
    
    //底部的数据控件
    
    fileprivate lazy var bottomView:LeeHotBottomView = {
        
        var arr:[UIViewController] = [UIViewController]()
        
        for (index,model)in (self.banners?.enumerated())! {
            
            let hotVc = LeeHotCategoryViewController()
            hotVc.rank = model.id
            arr.append(hotVc)
        }
        let view = LeeHotBottomView(frame:CGRect(x: 0,y: titleHeight + 1, width: WIDTH, height: HEIGHT),vcs:arr,parent:self)
        view.delegate = self
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.title = "榜单"
        automaticallyAdjustsScrollViewInsets = false
        
        view.backgroundColor = UIColor.colorWithCustom(240, g: 240, b: 240)
        setupUI()
        setNav()
    }
    
    fileprivate func setupUI(){
        request.requetHotBanner { (arrs, error) in
            
            guard error == nil else {return }
            
            self.banners = arrs
        }
        
    }
    
}
extension LeeHotViewController {
    //MARK:右边的分享按钮
    fileprivate  func setNav(){
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(imageNormal: "postitem_toolbar_share",seletedImage: "postitem_toolbar_share",target: self , sel: #selector(self.rightItemClick),size: CGSize(width: 30, height: 30))
        
    }
    @objc fileprivate  func rightItemClick(){
        
        print("分享")
    }
    
}
//MARK:改变title的触摸
extension LeeHotViewController : LeeHotTopBannerDelegate {
    
    func hotTopTitleClick(_ hot: LeeHotTopBanner, index: Int) {
        
        self.bottomView.changePageControler(index)
    }
}
//MARK:改变collectionView的页码
extension LeeHotViewController :LeePageContentViewDelegate {
    
    func scrollContentIndex(_ pageContent: LeeHotBottomView, progress: CGFloat, targetIndex: Int, sourceIndex: Int) {
        topBanner.showProgress(progress, targetInex: targetIndex, sourceIndex: sourceIndex)
    }
}










