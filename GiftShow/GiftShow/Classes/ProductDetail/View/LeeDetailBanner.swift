//
//  LeeHotTopBanner.swift
//  GiftShow
//
//  Created by admin on 16/10/26.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit
private let  kLebalHeight:CGFloat = 64
protocol LeeDetailBannerDelegate :class {
    func hotTopTitleClick(_ hot:LeeDetailBanner,index:Int)
}
class LeeDetailBanner: UIView {
    
    weak var delegate:LeeDetailBannerDelegate?
    fileprivate var currentIndex:Int = 0  //保存当前点击的title
    //scroView
    fileprivate lazy var myScrollView : UIScrollView = {
        
        let scr = UIScrollView()
        
        scr.showsVerticalScrollIndicator = false
        scr.showsHorizontalScrollIndicator = false
        scr.bounces = true
        scr.isPagingEnabled  = true
        return scr
    }()
    var titles:[String]? //标签
    fileprivate lazy var bottomLine:UIView = UIView()
    fileprivate lazy var scroLineView: UIView = UIView() //底部划线
    var labelArrays:[UILabel] = [UILabel]()
    init(frame: CGRect,arrs:[String]) {
        self.titles = arrs
        super.init(frame: frame)
        makeUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension LeeDetailBanner {
    
    fileprivate func makeUI(){
        
        addSubview(myScrollView)
        myScrollView.frame = self.bounds
        makeTitles() //添加标题
        //添加下划线
        makeBottomLine()
        
    }
    fileprivate func makeBottomLine(){
    
        guard let firstLabel  = labelArrays.first  else {
            return
        }
        
        firstLabel.textColor = UIColor.red
        addSubview(scroLineView)
        scroLineView.backgroundColor = UIColor.red
        scroLineView.frame = CGRect(x: firstLabel.frame.origin.x, y: kLebalHeight - 2, width: firstLabel.bounds.size.width, height: 2)
    }
    
    fileprivate func makeTitles(){
        let labelWidth = 200  / CGFloat(titles!.count)
        let labelHeight:CGFloat = 44
        let labelY:CGFloat = 23
        for (index,model) in (titles?.enumerated())! {
            
            let label = UILabel()
            label.text = model
            label.tag = index
            label.frame = CGRect(x: labelWidth * CGFloat(index), y: labelY, width: labelWidth, height: labelHeight)
            
            label.textAlignment = .center
            
            label.font = UIFont(name: FZLanTingHeiELGBK,size: 12)
            label.isUserInteractionEnabled = true
            let tap = UITapGestureRecognizer(target: self ,action: #selector(self.tap(_:)))
            label.addGestureRecognizer(tap)
            
            myScrollView.addSubview(label)
            labelArrays.append(label)
            
            
        }
    }
    
    @objc fileprivate func tap(_ tap:UITapGestureRecognizer){
        
        //取出当前的label
        guard let cureentLabel = tap.view as? UILabel else {return }
        
        //取出旧label
        let oldCurrentLabel = labelArrays[currentIndex]
        //判断是否两个一致
        guard  oldCurrentLabel != cureentLabel else {return }
        
        cureentLabel.textColor = UIColor.red
        oldCurrentLabel.textColor = UIColor.black
        currentIndex = cureentLabel.tag
        
        //改变划线的位置
        let curentX = CGFloat(currentIndex) * scroLineView.frame.width
        UIView.animate(withDuration: 0.25, animations: {
            self.scroLineView.frame.origin.x = curentX
        }) 
        //通过代理传值
        self.delegate?.hotTopTitleClick(self, index: currentIndex)
    }
}


extension LeeDetailBanner {
    //获取collectionView滚动的数据，来改变标题的状态
    func showProgress(_ progress:CGFloat,targetInex:Int,sourceIndex:Int) {
        //取出来source对应的label，和target对应的label
        
        let sourceLabel = labelArrays[sourceIndex]
        let targetLabel = labelArrays[targetInex]
        sourceLabel.textColor = UIColor.black
        targetLabel.textColor = UIColor.red
        //处理滑块逻辑
        let moveTotalX = (targetLabel.frame.origin.x - sourceLabel.frame.origin.x) * progress
        scroLineView.frame.origin.x = sourceLabel.frame.origin.x + moveTotalX
        //记录最新的index
        currentIndex = targetInex
    }
}




