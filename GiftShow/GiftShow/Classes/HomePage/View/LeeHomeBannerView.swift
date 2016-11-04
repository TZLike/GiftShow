//
//  LeeHotTopBanner.swift
//  GiftShow
//
//  Created by admin on 16/10/26.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit
private let  kLebalHeight:CGFloat = 44
protocol LeeHomeBannerViewDelegate :class {
    func hotTopTitleClick(_ hot:LeeHomeBannerView,index:Int)
}
class LeeHomeBannerView: UIView {
    
    weak var delegate:LeeHomeBannerViewDelegate?
    fileprivate var currentIndex:Int = 0  //保存当前点击的title
    //scroView
    fileprivate lazy var myScrollView : UIScrollView = {
        
        let scr = UIScrollView()
        scr.showsVerticalScrollIndicator = false
        scr.showsHorizontalScrollIndicator = false
        scr.bounces = true
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
extension LeeHomeBannerView {
    
    fileprivate func makeUI(){
        
        addSubview(myScrollView)
        myScrollView.frame = self.bounds
        makeTitles() //添加标题
        //添加下划线
        makeBottomLine()
        
    }
    fileprivate func makeBottomLine(){
        
        addSubview(bottomLine)
        
        bottomLine.frame = CGRect(x: 0, y: kLebalHeight - 1, width: WIDTH, height: 1)
        bottomLine.backgroundColor = UIColor.groupTableViewBackground
        
        guard let firstLabel  = labelArrays.first  else {
            return
        }
        
        firstLabel.textColor = UIColor.red
        myScrollView.addSubview(scroLineView)
        scroLineView.backgroundColor = UIColor.red
        scroLineView.center = CGPoint(x:firstLabel.center.x,y:self.bounds.height - 2.0)
        scroLineView.bounds = CGRect(origin: CGPoint.zero, size: CGSize(width: firstLabel.bounds.width - 15.0, height: 2.0))
        
    }
    fileprivate func makeTitles(){
        let labelWidth = WIDTH / 6
        let labelHeight = kLebalHeight
        let labelY:CGFloat = 0
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
        
        myScrollView.contentSize = CGSize(width:labelWidth * CGFloat((titles?.count)!),height:0)
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
        
        //改变划线的位位置
        UIView.animate(withDuration: 0.25, animations: {
           self.scroLineView.center = CGPoint(x: cureentLabel.center.x, y: self.bounds.height - 2.0)
            if cureentLabel.center.x < self.bounds.width * 0.5 {
                self.myScrollView.setContentOffset(CGPoint.zero, animated: true)
            } else if self.myScrollView.contentSize.width > self.bounds.width && cureentLabel.center.x > self.bounds.width * 0.5  && cureentLabel.center.x < (self.myScrollView.contentSize.width - self.bounds.width * 0.5) {
                self.myScrollView.setContentOffset(CGPoint(x: cureentLabel.frame.origin.x + cureentLabel.bounds.width * 0.5 - self.bounds.width * 0.5, y: 0), animated: true)
            } else {
                self.myScrollView.setContentOffset(CGPoint(x: max(self.myScrollView.contentSize.width - self.myScrollView.bounds.size.width, 0), y: 0), animated: true)
            }
            /// 重新调用layoutSubviews
            self.setNeedsLayout()

        })
        //通过代理传值
        self.delegate?.hotTopTitleClick(self, index: currentIndex)
    }
}


extension LeeHomeBannerView {
    //获取collectionView滚动的数据，来改变标题的状态
    func showProgress(_ progress:CGFloat,targetInex:Int,sourceIndex:Int) {
        //取出来source对应的label，和target对应的label
        
        let sourceLabel = labelArrays[sourceIndex]
        let targetLabel = labelArrays[targetInex]
        sourceLabel.textColor = UIColor.black
        targetLabel.textColor = UIColor.red
        UIView.animate(withDuration: 0.25, animations: {
            self.scroLineView.center = CGPoint(x: targetLabel.center.x, y: self.bounds.height - 2.0)
            if targetLabel.center.x < self.bounds.width * 0.5 {
                self.myScrollView.setContentOffset(CGPoint.zero, animated: true)
            } else if self.myScrollView.contentSize.width > self.bounds.width && targetLabel.center.x > self.bounds.width * 0.5  && targetLabel.center.x < (self.myScrollView.contentSize.width - self.bounds.width * 0.5) {
                self.myScrollView.setContentOffset(CGPoint(x: targetLabel.frame.origin.x + targetLabel.bounds.width * 0.5 - self.bounds.width * 0.5, y: 0), animated: true)
            } else {
                self.myScrollView.setContentOffset(CGPoint(x: max(self.myScrollView.contentSize.width - self.myScrollView.bounds.size.width, 0), y: 0), animated: true)
            }
            /// 重新调用layoutSubviews
            self.setNeedsLayout()
            
        })

        //记录最新的index
        currentIndex = targetInex
    }
}




