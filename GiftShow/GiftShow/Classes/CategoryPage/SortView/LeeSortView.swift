//
//  LeeSortView.swift
//  GiftShow
//
//  Created by admin on 16/10/28.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit

enum sortViewLoadType {
    case defaultType
    case hotType
    case lowToHighType
    case highToLowType
}
private let sortTableCellId =  "sortTableCellId"

protocol LeeSortViewDelegate :class  {
    
    func seletedIndex(view:LeeSortView,type:sortViewLoadType)
}
class LeeSortView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        isHidden = true
        myTableView.delegate = self
        myTableView.dataSource  = self
        myTableView.separatorStyle = .none
        myTableView.register(UINib(nibName: "LeeSortListCell",bundle:nil), forCellReuseIdentifier: sortTableCellId)
        myTableView.isScrollEnabled = false
    }
    fileprivate var selectIndex:Int = 0
    weak var delegate:LeeSortViewDelegate?
    @IBOutlet weak var myTableView: UITableView!
    fileprivate var coverBtn:UIButton = {
        let btn = UIButton()
        btn.frame = CGRect(x: 0, y: 0, width: WIDTH, height: HEIGHT)
        btn.backgroundColor = UIColor.black.withAlphaComponent(0.3)
        return btn
    }()
    
    fileprivate lazy var titles:[String] = {
        
        return ["默认排序","按热度排序","价格从低到高","价格从高到低"]
    }()
    
}

extension LeeSortView {
    
    class func getInfo()-> LeeSortView{
        
        return Bundle.main.loadNibNamed("LeeSortView", owner: nil
            , options: nil)?.first as! LeeSortView
    }
    
    
    func show(){
        // 更改anchorPoint后，position(frame)会改变
        let oldposition = layer.position
        let oldanchorPoint = layer.anchorPoint
        let newanchorPoint = CGPoint(x: 0.5, y: 0.0)
        let newpositionX = oldposition.x + (newanchorPoint.x - oldanchorPoint.x)  * bounds.size.width
        let newpositionY = oldposition.y + (newanchorPoint.y - oldanchorPoint.y)  * bounds.size.height
        isHidden = false
        transform = CGAffineTransform(scaleX: 1.0, y: 0.0)
        layer.anchorPoint = CGPoint(x: 0.5, y: 0.0)
        layer.position = CGPoint(x: newpositionX, y: newpositionY)
        UIView.animate(withDuration: 0.2, animations: {
            self.transform = CGAffineTransform.identity
        })
        UIApplication.shared.keyWindow?.insertSubview(self.coverBtn, belowSubview: self)
        self.coverBtn.addTarget(self, action: #selector(self.hide), for: UIControlEvents.touchUpInside)
    }
    
    func hide() {
        UIView.animate(withDuration: 0.2, animations: { () -> Void in
            self.transform = CGAffineTransform(scaleX: 1.0, y: 0.0000001)
        }, completion: { (_) -> Void in
            self.isHidden = true
            self .removeFromSuperview()
            self.coverBtn.removeFromSuperview()
        })
    }
}

extension LeeSortView :UITableViewDataSource , UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: sortTableCellId, for: indexPath) as! LeeSortListCell
        cell.myLabel?.text = self.titles[(indexPath as NSIndexPath).row]
        
        if selectIndex == (indexPath as NSIndexPath).row {
            cell.myLabel.textColor = UIColor.red
        }else {
            cell.myLabel.textColor = UIColor.white
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectIndex = (indexPath as NSIndexPath).row
        myTableView.reloadData()
        hide()
        var type:sortViewLoadType = .defaultType
        
        if (indexPath as NSIndexPath).row == 0 {
            type = .defaultType
        }else if (indexPath as NSIndexPath).row == 1{
            type = .hotType
        }else if((indexPath as NSIndexPath).row == 2){
            type = .lowToHighType
        }else {
            type = .highToLowType
        }
        delegate?.seletedIndex(view: self,type: type)
    }
}
