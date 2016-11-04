//
//  LeeMiddleView.swift
//  GiftShow
//
//  Created by admin on 16/10/25.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit
private let collectionViewMiddleId = "middleBannerCell"
class LeeMiddleView: UIView {

    var topArrays:[LeeMiddleBannerModel]?{
        didSet{
         myCollectionView.reloadData()
        }
    }
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        autoresizingMask = UIViewAutoresizing()
        myCollectionView.dataSource = self
        myCollectionView.register(UINib(nibName: "LeeMiddleBannerCell",bundle: nil), forCellWithReuseIdentifier: collectionViewMiddleId)
        myCollectionView.contentInset = UIEdgeInsetsMake(0, 10, 0, 10)
    }
}

extension LeeMiddleView {
    class func getInfo()->LeeMiddleView {
        return Bundle.main.loadNibNamed("LeeMiddleView", owner: nil, options: nil)!.first as! LeeMiddleView
    }
}

extension LeeMiddleView : UICollectionViewDataSource,UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return   topArrays?.count ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewMiddleId, for: indexPath) as! LeeMiddleBannerCell
        cell.model = topArrays![(indexPath as NSIndexPath).item ]
        return cell
}
}


