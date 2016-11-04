//
//  LeeCommonDetailViewController.swift
//  GiftShow
//
//  Created by admin on 16/10/31.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit
private let  LeeNavHeight: CGFloat = 64

class LeeCommonDetailViewController: UIViewController {
    
    //自定义导航栏
    private let hotVc = LeeProductDetailViewController()
    private let webVc = LeeProductWebDetailViewController()
    var request:LeeHomeVVModel = LeeHomeVVModel()
    var model:LeeListDetailModel?{
        didSet{
         
            hotVc.model = model
            webVc.html  = model?.detail_html
        }
    }
    var currentProgress:CGFloat = 0
    var id:NSNumber = 0 
    fileprivate lazy var customNav: UIView = {
        let customNav = UIView(frame: CGRect(x: 0, y: 0, width: WIDTH, height: LeeNavHeight))
        customNav.backgroundColor = UIColor.white
        customNav.alpha = 0.0
        return customNav
    }()
    //顶部的banner
    fileprivate lazy var topBanner:LeeDetailBanner = {[weak self] in
        
        let topBanner = LeeDetailBanner(frame:CGRect(x: (WIDTH - 200) / 2, y: 0, width:WIDTH ,height: LeeNavHeight),arrs:(self?.banners)!)
        topBanner.delegate = self 
        return topBanner
        }()
    //返回按钮
    fileprivate lazy var backBtn:UIButton = {
      let btn = UIButton()
        btn.frame = CGRect(x:10,y:28,width:30,height:30)
        btn.setImage(UIImage(named:"navigationButtonReturn"), for: UIControlState.normal)
        btn.addTarget(self, action: #selector(self.back), for: UIControlEvents.touchUpInside)
        return btn
    }()
    fileprivate var banners:[String] = {
        return ["单品","详情","评论"]
    }()
    
    fileprivate lazy var bottomView:LeeProductBottomView = {
        
        var arr:[UIViewController] = [UIViewController]()
        
            self.hotVc.delegate = self
            arr.append(self.hotVc)
            arr.append(self.webVc)
           arr.append(LeeProductRecommendDetailViewController())
        let view = LeeProductBottomView(frame:CGRect(x: 0,y: 0, width: WIDTH, height: HEIGHT),vcs:arr,parent:self)
        view.delegate = self
        return view
    }()
    
    fileprivate var buyView:LeeBottomToBuyView = {
      let view = LeeBottomToBuyView.getInfo()
        view.frame = CGRect(x:0,y:HEIGHT - 50,width:WIDTH,height:50)
        view.backgroundColor = UIColor.white
        
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "订单详情"
        view.addSubview(bottomView)
        view.addSubview(customNav)
        view.addSubview(backBtn)
        view.addSubview(topBanner)
        view.addSubview(buyView)
        view.backgroundColor = UIColor.white
        loadData()
        
    }
    
    //返回上级控制器
    func back(){
     navigationController?.popViewController(animated: true)
        
    }
    
}

extension LeeCommonDetailViewController {
 
    fileprivate func loadData(){
     
        request.requestProductDetail(id: { () -> NSNumber in
            return self.id
        }, finished: { (model, error) in
            

            self.model = model
    
            
        })

    }
}
extension LeeCommonDetailViewController {
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true , animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false , animated: true)
        
    }
}

extension LeeCommonDetailViewController : LeeProductDetailViewControllerDelegate {
    func changeProgeress(progress: CGFloat) {
        
        currentProgress = progress
       self.customNav.alpha = progress
    }
}


//MARK:改变title的触摸
extension LeeCommonDetailViewController : LeeDetailBannerDelegate {
    
    func hotTopTitleClick(_ hot: LeeDetailBanner, index: Int) {
        
        self.bottomView.changePageControler(index)
        
        guard   index == 0 else {
            self.customNav.alpha = 1.0
            
            return
        }
        guard currentProgress > 0 else {
            self.customNav.alpha = 0.0
            return
        }
        self.customNav.alpha = currentProgress

    }
}
//MARK:改变collectionView的页码
extension LeeCommonDetailViewController :LeeProductBottomViewDelegate {
    
    func scrollContentIndex(_ pageContent: LeeProductBottomView, progress: CGFloat, targetIndex: Int, sourceIndex: Int) {
        topBanner.showProgress(progress, targetInex: targetIndex, sourceIndex: sourceIndex)
    
        
        if currentProgress > 0 {
        
            if targetIndex == 0 {
            self.customNav.alpha = currentProgress
            }else {
            self.customNav.alpha = currentProgress + progress
            }
        }
        
        
        else {
            if(targetIndex == 0){
            self.customNav.alpha = 1 - progress
            }else if (targetIndex == 2) {
                self.customNav.alpha = 1.0
           
            }else {
        
                if sourceIndex == 2 {
                 self.customNav.alpha = 1.0
                }else {
              self.customNav.alpha = progress
                }
            }
        }
    }
}

