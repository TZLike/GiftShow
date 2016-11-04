//
//  LeeSingleListViewController.swift
//  GiftShow
//
//  Created by admin on 16/10/27.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit
private let kCateListMargin:CGFloat = 10

private let kCateListWidth:CGFloat = (WIDTH - 3 * kCateListMargin ) / 2
private let kCateListHeight:CGFloat  = kCateListWidth * 4 / 3 + 15
private let collectionCateListViewId = "LeeHotCell"

class LeeSingleListViewController: UIViewController {

    //设置请求类型
    fileprivate var type:sortViewLoadType = sortViewLoadType.defaultType
    //懒加载pop
    
    fileprivate  lazy var sortView :LeeSortView = { [weak self]in
        
        let  sort = LeeSortView.getInfo()
        sort.frame = CGRect(x: WIDTH - 160, y:64, width: 155, height: 180)
      sort.delegate = self
       
        return sort
    }()
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    var model:LeeSingleCateModel?
    var arrs:[LeeCateSingleListModel]?{
        didSet{
         myCollectionView.reloadData()
        }
    }
    var request:LeeHomeVVModel = LeeHomeVVModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = model?.name
        makeUI()
     
        
        loadData()
    }
    
    fileprivate func loadData(){
     

        
        request.requestSingleListData({ () -> NSNumber in
            return self.model?.id ?? 0
        }, getType: { () -> sortViewLoadType in
            return self.type
        }, finished: { (arrs, error) in
            self.arrs = arrs
        })
    }
    

}

extension LeeSingleListViewController {
    fileprivate func makeUI(){
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageNormal: "icon_sort",seletedImage: "icon_sort",target: self , sel: #selector(self.sort),size: CGSize(width: 25, height: 25))
        let layout = myCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing =  10
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: kCateListWidth, height: kCateListHeight)
        layout.sectionInset = UIEdgeInsetsMake(kCateListMargin, kCateListMargin, 0, kCateListMargin)
        myCollectionView.register(LeeHotContentCell.self, forCellWithReuseIdentifier: collectionCateListViewId)
        myCollectionView.dataSource = self
        myCollectionView.backgroundColor = UIColor.colorWithHexString("f9f5f4")

        
       
    }
    
    @objc fileprivate func sort(){
        
    
        UIApplication.shared.keyWindow?.addSubview(sortView)
        
        if sortView.isHidden {
            sortView.show()
        }else {
            sortView.hide()
            
        }

    }
    
   
}
extension LeeSingleListViewController  :UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrs?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectionCateListViewId, for: indexPath) as! LeeHotContentCell
        cell.backgroundColor = UIColor.white
        cell.listModel = arrs![(indexPath as NSIndexPath).item]
        return cell
    }
}

extension LeeSingleListViewController :LeeSortViewDelegate {
    func seletedIndex(view: LeeSortView, type: sortViewLoadType) {
        
        self.type = type
        //加载数据
        loadData()
    }
}
