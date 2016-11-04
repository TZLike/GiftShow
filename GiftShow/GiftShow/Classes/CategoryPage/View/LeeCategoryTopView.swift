//
//  LeeCategoryTopView.swift
//  GiftShow
//
//  Created by admin on 16/10/27.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit

private let kItemCateWidth:CGFloat = WIDTH * 0.75
private let kItemCateHeight:CGFloat = 75
private let kItemCateMargin:CGFloat = 10
private let kCateCollectionId = "LeeCateTopId"
private let kCatemoreId = "moreCellId"
class LeeCategoryTopView: UIView {

   
    var models:[LeeTopCategoryModel]?{
        didSet{
         myCollectionView.reloadData()
        }
    }
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        let layout  = myCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        layout.itemSize = CGSize(width: kItemCateWidth, height: kItemCateHeight)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        myCollectionView.backgroundColor = UIColor.white
        myCollectionView.register(UINib(nibName: "LeeCateTopCell",bundle: nil), forCellWithReuseIdentifier: kCateCollectionId)
           myCollectionView.register(UINib(nibName: "LeeCateMoreBtnCell",bundle: nil), forCellWithReuseIdentifier: kCatemoreId)
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
        myCollectionView.contentInset = UIEdgeInsetsMake(kItemCateMargin, kItemCateMargin, kItemCateMargin, kItemCateMargin)
        
  
    }

}

extension LeeCategoryTopView {

    class func getInfo()->LeeCategoryTopView {
    
        return Bundle.main.loadNibNamed("LeeCategoryTopView", owner: nil, options: nil)!.first as! LeeCategoryTopView
    }
}
extension LeeCategoryTopView :UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCateCollectionId, for: indexPath) as! LeeCateTopCell
            cell.model = models![(indexPath as NSIndexPath).item]
            return cell
    }
    
}
