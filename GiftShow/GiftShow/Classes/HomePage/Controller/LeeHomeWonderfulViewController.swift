//
//  LeeHomeWonderfulViewController.swift
//  GiftShow
//
//  Created by admin on 16/10/22.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//  这是精选页面

import UIKit
import MJRefresh
private let kHeaderHeight:CGFloat = 185
private let kMiddleHeight:CGFloat = 100
private let LeeCotentCell1 = "LeeCotentCell"
class LeeHomeWonderfulViewController: LeeBaseFatherViewController {
    var request:LeeHomeVVModel = LeeHomeVVModel()
    var channels:Int = 0
    //底部数据
    var contentArray:[LeeCotentModel]?{
        didSet{
         myTableView.reloadData() //刷新表格
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        view.backgroundColor = UIColor.white
        loadData()
    }
    //初始化视图
    
    fileprivate func setupUI(){
        view .addSubview(myTableView)
        myTableView.addSubview(headView)
        myTableView.addSubview(middleView)
        myTableView.contentInset = UIEdgeInsetsMake(kHeaderHeight + kMiddleHeight, 0, 0, 0)
         myTableView.register(UINib(nibName: "LeeCotentCell", bundle: nil), forCellReuseIdentifier: LeeCotentCell1)

    }
    //加载数据
    @objc fileprivate func loadData(){
        //加载底部数据
        request.requstHome { (arrs, error) in
            self.contentArray = arrs
        }
        //加载无线轮播图
          request.requestHomeCycle { (arrs, error) in
        
            self.headView.topArrays = arrs
        }
        //加载中间的选项卡
        
        request.requestMiddle { (arrs, error) in
            
            self.middleView.topArrays = arrs
        }
    }
    
    //中间的数据
    
    fileprivate lazy var middleView:LeeMiddleView = {
      let middleView = LeeMiddleView.getInfo()
        middleView.frame = CGRect(x: 0, y: -kMiddleHeight, width: WIDTH, height: kMiddleHeight)
        return middleView
    }()
    //上面的无线轮播
    fileprivate lazy var headView:LeeHomeCycleView = {
        let headView = LeeHomeCycleView.getInfo()
        
        headView.frame = CGRect(x: 0, y: -(kHeaderHeight + kMiddleHeight), width: WIDTH, height: kHeaderHeight)
        
        return headView
    }()

    //懒加载表格
    fileprivate lazy var myTableView:UITableView = {
      
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.backgroundColor = GlobalColor
        table.separatorStyle = UITableViewCellSeparatorStyle.none
        table.sectionFooterHeight = 0.0001
        table.sectionHeaderHeight = 0.0001
        table.frame = CGRect(x: 0, y: 0, width: WIDTH, height: HEIGHT - 44 - 64 - 40 - 4)
        return table
    }()
}

extension LeeHomeWonderfulViewController:UITableViewDelegate,UITableViewDataSource {
 
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contentArray?.count ?? 0
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView .dequeueReusableCell(withIdentifier: LeeCotentCell1) as! LeeCotentCell
      cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.model = self.contentArray![(indexPath as NSIndexPath).row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let model = contentArray![(indexPath as NSIndexPath).row]
        return model.cellHeight
    }
}
