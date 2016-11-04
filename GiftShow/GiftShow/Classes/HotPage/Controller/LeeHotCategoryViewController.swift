//
//  LeeHotCategoryViewController.swift
//  GiftShow
//
//  Created by admin on 16/10/26.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit

private let kItemMargin:CGFloat = 10

private let kItemWidth:CGFloat = (WIDTH - 3 * kItemMargin ) / 2
private let kItemHeight:CGFloat  = kItemWidth * 4 / 3 + 18
private let kCoverImageHeight:CGFloat = 145
private let collectionViewId = "LeeHotCell"
class LeeHotCategoryViewController: UIViewController {

    var rank:NSNumber = 0
    
    //请求数据
  fileprivate  var request:LeeHomeVVModel = LeeHomeVVModel()
    
    //数据模型
    
    var models:[LeeHotModel]?{
        didSet{
            
         self.myCollectionView.reloadData()
        
        }
    }
    //上面的覆盖view
    fileprivate lazy var coverImage:LeeHotCoverView  = {
      
        let cover = LeeHotCoverView.getInfo()
        cover.frame = CGRect(x: 0, y: -kCoverImageHeight, width: WIDTH, height: kCoverImageHeight)
        return cover
    }()
    //UICollectionView
    fileprivate lazy var myCollectionView:UICollectionView = {
     
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing =  10
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: kItemWidth, height: kItemHeight)
        layout.sectionInset = UIEdgeInsetsMake(kItemMargin, kItemMargin, 0, kItemMargin)
        let coll = UICollectionView(frame:CGRect(x: 0, y: 0, width: WIDTH, height: HEIGHT - 108 - 28),collectionViewLayout:layout)
        coll.register(LeeHotContentCell.self, forCellWithReuseIdentifier: collectionViewId)
        coll.dataSource = self
        coll.delegate = self
        coll.backgroundColor = UIColor.colorWithHexString("f9f5f4")
        return coll
        
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
   
        makeUI()
        loadData()
    }
    
}

extension LeeHotCategoryViewController {

    fileprivate func makeUI(){
      view.backgroundColor = UIColor.colorWithHexString("f9f5f4")
        view.addSubview(myCollectionView)
        myCollectionView.addSubview(coverImage)
        myCollectionView.contentInset = UIEdgeInsetsMake(kCoverImageHeight, 0, 0, 0)
    }
}

extension LeeHotCategoryViewController  :UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.models?.count ?? 0 
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewId, for: indexPath) as! LeeHotContentCell
        cell.backgroundColor = UIColor.white
        cell.model = models![(indexPath as NSIndexPath).item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //category_id
        
        let model = self.models?[indexPath.item]
        let vc = LeeCommonDetailViewController()
        vc.id = (model?.id)!
        //进入订单详情页
       navigationController?.pushViewController(vc, animated: true)
    }    
}


extension LeeHotCategoryViewController {

    fileprivate func loadData(){
        request.requestHotData({ () -> NSNumber in
            return self.rank
        }) { (model, error) in
            
            self.models = model?.models
            self.coverImage.coverImageView .sd_setImage(with: model?.cover_imageURl, placeholderImage:UIImage(named: "comment_placeholder"))
        }
    }

}








