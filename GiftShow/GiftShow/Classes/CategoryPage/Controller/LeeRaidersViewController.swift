//
//  LeeRaidersViewController.swift
//  GiftShow
//
//  Created by admin on 16/10/27.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
// 攻略

import UIKit

private let kItemMargin:CGFloat = 10

private let kItemWidth:CGFloat = (WIDTH - kItemMargin * 3) / 2

private let kItemHeight:CGFloat = kItemWidth * 3 / 7 + 10

private let kTopViewHeight:CGFloat  = 310
private let collectionId = "collectionId"
private let headerCollectionId = "headerCollectionId"
class LeeRaidersViewController: UIViewController {

    var  models:[LeeCategoryModel]?{
        didSet{
          myCollectionView.reloadData()
        }
    }
    //加载上面的view
    fileprivate lazy var topView:LeeCategoryTopView = {
    
        let topView = LeeCategoryTopView.getInfo()
        topView.frame = CGRect(x: 0, y: -kTopViewHeight, width: WIDTH, height: kTopViewHeight)
        return topView
    }()
  fileprivate  var request:LeeHomeVVModel = LeeHomeVVModel()
    
    //加载collectionView
    fileprivate lazy var myCollectionView:UICollectionView = {
    
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumLineSpacing = kItemMargin
        flowLayout.minimumInteritemSpacing = 0
        flowLayout.sectionInset = UIEdgeInsetsMake(kItemMargin, kItemMargin, kItemMargin, kItemMargin)
        flowLayout.itemSize = CGSize(width: kItemWidth, height: kItemHeight)
        flowLayout.headerReferenceSize = CGSize(width: WIDTH, height: 40)
        let coll = UICollectionView(frame:CGRect(x: 0, y: 0, width: WIDTH, height: HEIGHT - 108 - 40),collectionViewLayout:flowLayout)
        coll.contentInset = UIEdgeInsetsMake(kTopViewHeight, 0, 0, 0)
//        coll.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: collectionId)
        coll.dataSource = self
        coll.delegate  = self
        coll.backgroundColor = UIColor.white
//        coll.registerClass(UICollectionReusableView.self, forSupplementaryViewOfKind:UICollectionElementKindSectionHeader, withReuseIdentifier:headerCollectionId)
        
          coll.register(UINib(nibName: "LeeCateReusableView",bundle: nil), forSupplementaryViewOfKind:UICollectionElementKindSectionHeader , withReuseIdentifier: headerCollectionId)
        
        coll.register(UINib(nibName: "LeeCategoryCell",bundle: nil), forCellWithReuseIdentifier: collectionId)
        
        return coll
        
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        view.addSubview(myCollectionView)
        myCollectionView.addSubview(topView)
        view.backgroundColor = UIColor.white
        //记载攻略数据 
        request.requestCateData { (arrs, error) in
            
           self.models = arrs
        }
        
        //加载顶部数据
        
        
        request.requestCateTopData { (arrs, error) in
           
            guard error == nil else { return }
            self.topView.models = arrs
            
        }
    }

}

extension LeeRaidersViewController :UICollectionViewDataSource {
 
    func numberOfSections(in collectionView: UICollectionView) -> Int {
      return  self.models?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let model = self.models![section] 
        return  (model.channels?.count)! > 6 ? 6 : (model.channels?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionId, for: indexPath) as! LeeCategoryCell
       let model = models![(indexPath as NSIndexPath).section]
        cell.model = model.channers[(indexPath as NSIndexPath).item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerCollectionId, for: indexPath) as! LeeCateReusableView
        header.model = models![(indexPath as NSIndexPath).section]
        return header
    }
    
}

extension LeeRaidersViewController :UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
   
        
    }
}
