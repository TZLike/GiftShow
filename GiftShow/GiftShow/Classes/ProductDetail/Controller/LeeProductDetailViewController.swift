//
//  LeeHotCategoryViewController.swift
//  GiftShow
//
//  Created by admin on 16/10/26.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit

private let  LeeNavHeight: CGFloat = 64
private let  kItemMargin:CGFloat = 10
private let  LeebottomViewHeight:CGFloat = 44
private let  headerCollectionId = "LeeProductDetailReusable"
private let kItemWidth:CGFloat = (WIDTH - 3 * kItemMargin ) / 2
private let kItemHeight:CGFloat  = kItemWidth * 4 / 3 + 25
private let kCoverImageHeight:CGFloat = 340

private let kCoverContentHeight:CGFloat = 260
private let collectionViewId = "LeeHotCell"

protocol LeeProductDetailViewControllerDelegate  : class {
    
    func changeProgeress(progress:CGFloat)
    
}
class LeeProductDetailViewController: UIViewController {
    
    weak var delegate:LeeProductDetailViewControllerDelegate?
    var model:LeeListDetailModel?{
        didSet{
         
            let arrImages = model?.image_urls
            guard let url  = arrImages?[0] else {
                return
            }
            
            self.myCollectionView .reloadData()
            let URL = NSURL(string:url)!
            
            self.coverImage.coverImageView.sd_setImage(with: URL as URL, placeholderImage:UIImage(named:"comment_placeholder") )
        }
    }
    //底部自定义view
    fileprivate lazy var bottomView:UIView  = {
    
        let view = UIView()
        view.frame = CGRect(x: 0, y: HEIGHT - LeebottomViewHeight, width: WIDTH, height: LeebottomViewHeight)
        view.backgroundColor = UIColor.white
        return view
    }()
    var rank:NSNumber = 0
    
    //请求数据
    var request:LeeHomeVVModel = LeeHomeVVModel()
    
    //数据模型
    
    var models:[LeeHotModel]?{
        didSet{
            
            self.myCollectionView.reloadData()
            
        }
    }
    //上面的覆盖view
    fileprivate lazy var coverImage:LeeHotCoverView  = {
        
        let cover = LeeHotCoverView.getInfo()
        cover.frame = CGRect(x: 0, y: -(kCoverImageHeight), width: WIDTH, height: kCoverImageHeight)
        return cover
    }()
    //UICollectionView
    fileprivate lazy var myCollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: kItemWidth, height: kItemHeight)
          layout.headerReferenceSize = CGSize(width: WIDTH, height: 240)
        layout.sectionInset = UIEdgeInsetsMake(kItemMargin, kItemMargin, 0, kItemMargin)
        let coll = UICollectionView(frame:CGRect(x: 0, y:-10, width: WIDTH, height: HEIGHT),collectionViewLayout:layout)
         coll.register(LeeHotContentCell.self, forCellWithReuseIdentifier:collectionViewId)

        coll.dataSource = self
        coll.delegate = self
        coll.backgroundColor = UIColor.colorWithHexString("f9f5f4")
        coll.register(UINib(nibName: "LeeProductDetailReusable",bundle: nil), forSupplementaryViewOfKind:UICollectionElementKindSectionHeader , withReuseIdentifier: headerCollectionId)
        return coll
        
        
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUI()
        loadData()

        view.backgroundColor = UIColor.white
    }
    
}

extension LeeProductDetailViewController {
    
    fileprivate func makeUI(){
        view.backgroundColor = UIColor.colorWithHexString("f9f5f4")
        view.addSubview(myCollectionView)
        myCollectionView.addSubview(coverImage)
        myCollectionView.contentInset = UIEdgeInsetsMake(kCoverImageHeight, 0, 0, 0)
    }
}

extension LeeProductDetailViewController  :UICollectionViewDataSource,UICollectionViewDelegate,UIScrollViewDelegate{
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
        navigationController?.pushViewController(LeeProductDetailViewController(), animated: true)
    }
    
    //监听collectionView的滚动
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let offsetY: CGFloat = scrollView.contentOffset.y
        
       
        if offsetY <= -kCoverImageHeight {
            coverImage.frame.origin.y =  offsetY
            coverImage.frame.size.height = -offsetY
            coverImage.frame.size.width = WIDTH - offsetY - kCoverImageHeight
            coverImage.frame.origin.x = (0 + kCoverImageHeight + offsetY) * 0.5
            //透明度为0
             delegate?.changeProgeress(progress: 0.0)
        }
        else {
            
            let progress:CGFloat =  -((offsetY / (-kCoverImageHeight)) - 1) + 0.35
           delegate?.changeProgeress(progress: progress)
         
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerCollectionId, for: indexPath) as! LeeProductDetailReusable
        header.model = self.model
        return header
    }
}


extension LeeProductDetailViewController {
    
    fileprivate func loadData(){
        request.requestHotData({ () -> NSNumber in
            return 1
        }) { (model, error) in
            
            self.models = model?.models


            
        }
    
        
    }
    
    
    
}




