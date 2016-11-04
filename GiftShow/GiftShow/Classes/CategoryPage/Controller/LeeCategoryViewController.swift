//
//  LeeCategoryViewController.swift
//  GiftShow
//
//  Created by admin on 16/10/27.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit
//import SnapKit
private let titleHeight:CGFloat = 44
class LeeCategoryViewController: UIViewController {
    
    //底部的数据控件
    
    fileprivate lazy var bottomView:LeeHotBottomView = {
        
        var arr:[UIViewController] = [UIViewController]()
        arr.append(LeeRaidersViewController())
        arr.append(LeeSingleProductViewController())
        let view = LeeHotBottomView(frame:CGRect(x: 0, y: 35, width: WIDTH, height: HEIGHT - 35),vcs:arr,parent:self)
        view.delegate = self
        return view
    }()
    //搜索
    fileprivate lazy var search:LeeHomeSearchView = {
        let view = LeeHomeSearchView.getInfo()
        view.backgroundColor = UIColor.colorWithHexString("FDF5F3")
        view.layer.cornerRadius = 12.5
        view.delegate = self
        view.clipsToBounds = true
        return view
    }()
    //头部banner
    fileprivate lazy var topBanner:LeeCategoryNavView = {[weak self] in
        
        let topBanner = LeeCategoryNavView(frame:CGRect(x: 0, y: 0, width: WIDTH / 3 - 20 ,height: titleHeight),arrs:["攻略","单品"])
        topBanner.delegate = self
        topBanner.backgroundColor = UIColor.white
        return topBanner
        }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNav()
        view.backgroundColor = UIColor.white
        navigationController?.navigationBar.shadowImage = UIImage()
        
    }
    
    
    
}

extension LeeCategoryViewController {
    
    fileprivate func setNav(){
        
        navigationItem.titleView = topBanner
        
        view.addSubview(search)
        
        view.addSubview(bottomView)
        search.snp.makeConstraints { (make) in
            make.left.equalTo(view).offset(15)
            make.right.equalTo(view).offset(-15)
            make.top.equalTo(view).offset(5)
            make.height.equalTo(25)
        }
        
        //        showAge(age: 10)
    }
    
}

extension LeeCategoryViewController :LeeCategoryNavViewDelegate {
    
    func categoryTopTitleClick(_ hot: LeeCategoryNavView, index: Int) {
        self.bottomView.changePageControler(index)
    }
    
    //    func showAge(age:Int){
    //     print(age)
    //    }
}

extension LeeCategoryViewController :LeeHomeSearchViewDelegate {
    func searchBtnClick() {
        print("aaa")
    }
}



//MARK:改变collectionView的页码
extension LeeCategoryViewController :LeePageContentViewDelegate {
    
    func scrollContentIndex(_ pageContent: LeeHotBottomView, progress: CGFloat, targetIndex: Int, sourceIndex: Int) {
        topBanner.showProgress(progress, targetInex: targetIndex, sourceIndex: sourceIndex)
    }
}
