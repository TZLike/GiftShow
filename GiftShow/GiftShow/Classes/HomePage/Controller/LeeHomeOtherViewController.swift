//
//  LeeHomeOtherViewController.swift
//  GiftShow
//
//  Created by admin on 16/10/23.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit
import MJRefresh
private let LeeCotentCell1 = "LeeCotentCell"
class LeeHomeOtherViewController: LeeBaseFatherViewController {
 
    var channels:Int = 0
    var contentArray:[LeeCotentModel]?{
        didSet{
            myTableView.reloadData() //刷新表格
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       view .addSubview(myTableView)
        
        myTableView.register(UINib(nibName: "LeeCotentCell", bundle: nil), forCellReuseIdentifier: LeeCotentCell1)
        
        let header = MJRefreshNormalHeader(refreshingTarget: self,refreshingAction: #selector(LeeHomeOtherViewController.loadData))
        myTableView.mj_header = header
        myTableView.mj_header .beginRefreshing()
        view.backgroundColor = UIColor.white
    
    }

    @objc fileprivate func loadData(){
        let dit = ["ad":"2","gender":"2","generation":"2","limit":"20","offset":"0"]
        LeeGiftNetworkTool.shareInstance().get("v2/channels/\(channels)/items_v2", parameters: dit, success: { (_, JSON) in
            self.myTableView.mj_header .endRefreshing()
             guard let JSON = JSON as? [String:NSObject] else {return }
            
            var dd = JSON["data"] as! [String:AnyObject]
            let array = dd["items"]  as! [[String : AnyObject]]
        
            let arrs =  self.Json2Modal(array)
        
            self.contentArray = arrs
           
        }) { (_, error) in
            self.myTableView.mj_header .endRefreshing()
        }

    }
    
     func Json2Modal(_ lists:[[String:AnyObject]]) -> [LeeCotentModel]{
        var arr = [LeeCotentModel]() //初始化一个数组
        for dict in lists{
            arr .append(LeeCotentModel(dict: dict))
        }
        return arr
    }
 
   
    
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

extension LeeHomeOtherViewController:UITableViewDelegate,UITableViewDataSource {
    
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
        return 350
    }
    

}

