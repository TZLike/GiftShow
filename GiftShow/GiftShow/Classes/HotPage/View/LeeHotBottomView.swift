//
//  LeeHotBottomView.swift
//  GiftShow
//
//  Created by admin on 16/10/26.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit
protocol LeePageContentViewDelegate:class  {
    func scrollContentIndex(_ pageContent:LeeHotBottomView,progress:CGFloat,targetIndex:Int,sourceIndex:Int)
}
private let collectionViewId = "collectionViewId"
class LeeHotBottomView: UIView {
    weak var delegate:LeePageContentViewDelegate?
    fileprivate var startOffsetX:CGFloat = 0  //起始位置
    fileprivate var isFord:Bool = false
    //懒加载UICollectionView
    fileprivate lazy var myCollectionView:UICollectionView = {
     
        let  flowLayout = UICollectionViewFlowLayout()
        flowLayout.minimumInteritemSpacing =  0
        flowLayout.minimumLineSpacing = 0
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = self.bounds.size
        
        let coll = UICollectionView(frame:CGRect.zero,collectionViewLayout: flowLayout)
        coll.dataSource = self
        coll.isPagingEnabled = true
        coll.delegate = self
        coll.bounces = false
        coll.showsVerticalScrollIndicator = false
        coll.showsHorizontalScrollIndicator = false 
         coll.register(UICollectionViewCell.self, forCellWithReuseIdentifier: collectionViewId)
        return coll
   
    }()
    
    weak var  parent:UIViewController?
    var childs:[UIViewController]
    init(frame: CGRect,vcs:[UIViewController],parent:UIViewController) {
        self.childs = vcs
        self.parent = parent
        super.init(frame: frame)
        
        makeUI()
       

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}

extension LeeHotBottomView {

    fileprivate  func makeUI(){
     
        //将所有的控制器加入父控件中
        for vc in childs {
         parent?.addChildViewController(vc)
        }
        addSubview(myCollectionView)
        myCollectionView.frame = bounds
    }
}


extension LeeHotBottomView :UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return childs.count 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionViewId, for: indexPath)
        //防止循环引用先删掉里面的View
        for view in cell.contentView.subviews {
            view.removeFromSuperview()
        }
        let vc = childs[(indexPath as NSIndexPath).item]
        vc.view.frame = cell.bounds
        cell.contentView.addSubview(vc.view)
        return cell

        
    }
}

extension LeeHotBottomView :UICollectionViewDelegate {
 
  
    //MARK: 监听CollectionView刚开始滑动
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        isFord = false
        startOffsetX = scrollView.contentOffset.x  //保存刚开始滑动位置
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        
        
        if isFord {return}
        // 1.定义要获取的内容
        var sourceIndex = 0
        var targetIndex = 0
        var progress : CGFloat = 0
        // 2.获取进度
        let offsetX = scrollView.contentOffset.x
        let ratio = offsetX / scrollView.bounds.width
        progress = ratio - floor(ratio)
        // 3.判断滑动的方向
        if offsetX > startOffsetX { // 向左滑动
            sourceIndex = Int(offsetX / scrollView.bounds.width)
            targetIndex = sourceIndex + 1
            if targetIndex >= childs.count {
                targetIndex = childs.count - 1
            }
            if offsetX - startOffsetX == scrollView.bounds.width {
                progress = 1.0
                targetIndex = sourceIndex
            }
        } else  { // 向右滑动
            targetIndex = Int(offsetX / scrollView.bounds.width)
            sourceIndex = targetIndex + 1
            if sourceIndex >= childs.count {
                sourceIndex = childs.count - 1
            }
            progress = 1 - progress
        }
        
        delegate?.scrollContentIndex(self, progress: progress, targetIndex: targetIndex, sourceIndex: sourceIndex)
    }

}
extension LeeHotBottomView {
    func changePageControler(_ index:Int)  {
        isFord = true
        //滚动正确的位置
        let offX = myCollectionView.bounds.width * CGFloat(index)
        //改变collectionView的offSet
        myCollectionView.setContentOffset(CGPoint(x: offX,y:0), animated: false)
        
    }
}
