//
//  LeeSingleProductViewController.swift
//  GiftShow
//
//  Created by admin on 16/10/27.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit

private let kCateItemMargin :CGFloat = 10
private let kCateItemHeight :CGFloat = 110
private let kCateItemWidth : CGFloat = (WIDTH - 90 - 3 * kCateItemMargin) / 3
private let kcateCollectionId  = "kcateCollectionId"
private let singleTableViewId = "singleTableViewId"

private let cateHeaderReusableId = "LeeCateHeaderReusableView"
class LeeSingleProductViewController: UIViewController {
    @IBOutlet weak var myTableView: UITableView!
    
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    var indexSection:Int = 0
    var tableRowSeleted:Bool = true
    var request:LeeHomeVVModel = LeeHomeVVModel()
    var models:[LeeSingleModel]?{
        didSet{
            myTableView.reloadData()
            //默认选中第一个
            myTableView.selectRow(at: IndexPath(row: 0,section: 0), animated: false, scrollPosition: UITableViewScrollPosition.top)
            myCollectionView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        request.requestSingleData { (arr, error) in
        self.models  = arr
        
        }
        
//        request.requestSingleData{(arr)in
//            self.models = arr
//         
//        }
    }
    
}

//初始化数据
extension LeeSingleProductViewController {

    fileprivate func setupUI(){
        myTableView.register(UINib(nibName: "LeeSingleTableCell",bundle: nil), forCellReuseIdentifier: singleTableViewId)
        view.backgroundColor = UIColor.white
        myTableView.backgroundColor = UIColor.white
        let layout  = myCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        layout.itemSize = CGSize(width: kCateItemWidth, height: kCateItemHeight)
        myCollectionView.register(UINib(nibName: "LeeCateHeaderReusableView",bundle: nil), forSupplementaryViewOfKind:UICollectionElementKindSectionHeader , withReuseIdentifier: cateHeaderReusableId)
        myCollectionView.register(UINib(nibName: "LeeSingleCollecitionCell",bundle: nil), forCellWithReuseIdentifier: kcateCollectionId)
        myCollectionView.contentInset = UIEdgeInsetsMake(kCateItemMargin, kCateItemMargin, kCateItemMargin, kCateItemMargin)
    }
}
//表格数据源代理
extension LeeSingleProductViewController :UITableViewDataSource ,UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  tableView.dequeueReusableCell(withIdentifier: singleTableViewId, for: indexPath) as! LeeSingleTableCell
       cell.selectionStyle = .none
        cell.model = models![(indexPath as NSIndexPath).row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        /// 滚动商品列表
        tableRowSeleted = false
        myCollectionView.scrollToItem(at: IndexPath(row: 0, section: (indexPath as NSIndexPath).row), at: UICollectionViewScrollPosition.top, animated: true)
    }
}

//商品分类列表数据源
extension LeeSingleProductViewController :UICollectionViewDataSource ,UICollectionViewDelegate{

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return models?.count ?? 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        let model = models![section]
        return model.cates.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: kcateCollectionId, for: indexPath) as! LeeSingleCollecitionCell
        let model = models![(indexPath as NSIndexPath).section]
       collectionViewCell.model = model.cates[(indexPath as NSIndexPath).item]
        
        return collectionViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: cateHeaderReusableId, for: indexPath) as! LeeCateHeaderReusableView
        let model = models![(indexPath as NSIndexPath).section]
        header.cateName.text = model.name
        return header
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize.zero
        }
        return CGSize(width: WIDTH - 130, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let model = models![(indexPath as NSIndexPath).section]
        let  singModel = model.cates[(indexPath as NSIndexPath).item]
        let vc = LeeSingleListViewController()
        vc.model = singModel
        navigationController?.pushViewController(vc, animated: true)
    }
    
//    func scrollViewDidScroll(scrollView: UIScrollView) {
//           
//        if tableRowSeleted {
//            
//        var currentIndex = 0
//        let rect = CGRect(origin: myCollectionView.contentOffset,size: myCollectionView.bounds.size)
//        let point = CGPointMake(CGRectGetMidX(rect), CGRectGetMidY(rect))
//        
//        let indexPath = myCollectionView.indexPathForItemAtPoint(point)
//        if currentIndex == indexPath?.section ||  indexPath == nil {
//        return
//            
//        }
//        currentIndex = (indexPath?.section)!
//        
//        if indexSection != currentIndex {
//        
//             myTableView.selectRowAtIndexPath(NSIndexPath(forRow: indexSection,inSection: 0), animated: false, scrollPosition: UITableViewScrollPosition.Top)
//        }
//        indexSection = currentIndex
//        
//        
//        
//        
//    }
//    }
    
    
}
