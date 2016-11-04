//
//  LeeHomeCycleView.swift
//  GiftShow
//
//  Created by admin on 16/10/25.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
// 无线轮播

import UIKit

private let collectionViewId = "LeeTopBanner"
class LeeHomeCycleView: UIView {

    var time:Timer?
    @IBOutlet weak var pageControl: UIPageControl!
     @IBOutlet weak var collectionView: UICollectionView!
    
    //无限轮播数据
    var topArrays:[LeeBannerModel]?{
        didSet{
            collectionView.reloadData()
            pageControl.numberOfPages = topArrays?.count ?? 0
            
            let indexPath = IndexPath(item:  (topArrays?.count ?? 0) * 10,section: 0)
            collectionView.scrollToItem(at: indexPath, at: UICollectionViewScrollPosition.left, animated: false)
            
            removeTime()
            addTime()
        }
    }
     override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "LeeTopCollectionCell",bundle: nil), forCellWithReuseIdentifier: collectionViewId)
        autoresizingMask = UIViewAutoresizing()
        collectionView.backgroundColor = UIColor.white
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let flowLayOut = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayOut.itemSize = collectionView.bounds.size
        
    }

}

extension LeeHomeCycleView {

    class func getInfo()->LeeHomeCycleView {
        return Bundle.main.loadNibNamed("LeeHomeCycleView", owner: nil, options: nil)!.first as! LeeHomeCycleView
    }
}

extension LeeHomeCycleView : UICollectionViewDataSource,UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return   (topArrays?.count ?? 0 ) * 10000
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewId, for: indexPath) as! LeeTopCollectionCell
        cell.model = topArrays![(indexPath as NSIndexPath).item %  topArrays!.count]
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let contentOffx = scrollView.contentOffset.x  +  collectionView.bounds.size.width * 0.5
        let currentPage = Int(contentOffx / WIDTH )  % (topArrays?.count ?? 1 )
        pageControl.currentPage = currentPage
    }
    // 用户滚动时暂停定时器
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        removeTime()
    }
    
    //用户结束时开启定时器
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        addTime()
    }
}

//添加定时器
extension LeeHomeCycleView {

    fileprivate func addTime(){
        time = Timer(timeInterval: 3.5,target: self , selector: #selector(self.toNext),userInfo: nil,repeats: true)
        
        RunLoop.main.add(time!, forMode:RunLoopMode.commonModes)
    }
    fileprivate func removeTime(){
      
        time?.invalidate()
        time = nil
    }
    
    @objc fileprivate func toNext(){
    
        let contentOffx = collectionView.contentOffset.x
        
        let toContentOffx = contentOffx + collectionView.bounds.width
        collectionView.setContentOffset(CGPoint(x: toContentOffx, y: 0), animated: true)
        
    }
}
