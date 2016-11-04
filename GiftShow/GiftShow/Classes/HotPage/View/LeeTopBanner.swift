//
//  LeeTopBanner.swift
//  GiftShow
//
//  Created by admin on 16/8/9.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit


protocol LeeTopBannerDelegate:NSObjectProtocol {
    
    
    func selectedIndex(_ index:NSInteger)
    
}

class LeeTopBanner: UIView {

    weak var delegate:LeeTopBannerDelegate?
    @IBOutlet weak var swichBtn: UIButton!
  
    @IBOutlet weak var taskCover: UIView!
    @IBOutlet weak var myScrollview: UIScrollView!
    
    
    //分类标题
    
    var categoryTitles:[NSString]? {
        
        didSet{
         
            //滚动分类视图
          createScrollBtn(categoryTitles!)
  
        }
     
    }
    //弹出分类视图的按钮列数
    
    let popverBtnColum = 4
    //缓存滚动分类按钮
    var cacheScrollCategoryBtns = [UIButton]()
  
    /// 当前所选的滚动分类按钮
    var selectedScrollCategoryBtn:UIButton?


    static func getInfo()->LeeTopBanner{
    
        return Bundle.main .loadNibNamed("LeeTopBanner", owner: nil, options: nil)!.last as! LeeTopBanner
    }
 //加载xib文件后，会调用此方法
    override func awakeFromNib() {
        
        super.awakeFromNib()
        setUp()
        myScrollview.showsVerticalScrollIndicator = false
        myScrollview.showsHorizontalScrollIndicator = false
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupUIFrame()
    }
    
    fileprivate func setUp(){
     myScrollview .addSubview(scrollBottomLineView)
    }
    
    fileprivate func setupUIFrame() {
        /// 设置scrollView contentSize
        if let lastCategoryBtn = cacheScrollCategoryBtns.last {
            myScrollview.contentSize = CGSize(width: lastCategoryBtn.frame.maxX, height: 0)
        }
        /// 设置底部线条frame
        if let categoryBtn = selectedScrollCategoryBtn {
            
            UIView .animate(withDuration: 0.25, animations: { 
                self.scrollBottomLineView.center = CGPoint(x: categoryBtn.center.x, y: self.bounds.height - 2.0)
                self.scrollBottomLineView.bounds = CGRect(origin: CGPoint.zero, size: CGSize(width: categoryBtn.bounds.width - 10.0, height: 2.0))
            })
           
        }
    }
    //MARK:往Scr上添加按钮
    
    fileprivate func createScrollBtn(_ titles:[NSString]){
     
        
        for i in 0..<titles.count {
         
            let title = titles[i]
            let btn = createBtn(title) //创建按钮
            btn.tag = i
            
            let width:CGFloat = title.boundingRect(with: CGSize.zero, options: NSStringDrawingOptions(rawValue:0), attributes: [NSFontAttributeName:btn.titleLabel!.font], context: nil).width + 20
            
            let x:CGFloat = cacheScrollCategoryBtns.last == nil ? 5.0 :cacheScrollCategoryBtns.last!.frame.maxX
            
            btn.frame = CGRect(x: x ,y: 0 ,width: width,height:  44)
            btn .addTarget(self, action:#selector(LeeTopBanner.scrollCategoryBtnAction(_:)),for: UIControlEvents.touchUpInside)
            
            myScrollview .addSubview(btn)
            
            cacheScrollCategoryBtns.append(btn)
            if i == 0 {
              scrollCategoryBtnAction(btn)
               
            }
        }
    }
    
   
    //创建按钮
    fileprivate func createBtn(_ str:NSString)->UIButton {
     let btn =  UIButton()
        
        btn .setTitle(str as String, for: UIControlState())
        btn.titleLabel?.font = UIFont(name: FZLanTingHeiELGBK,size: 14)
        btn.setTitleColor(UIColor(red: 102.0/255.0, green: 102.0/255.0, blue: 102.0/255.0, alpha: 1.0), for: UIControlState())
        btn.setTitleColor(UIColor(red: 251.0/255.0, green: 45.0/255.0, blue: 71.0/255.0, alpha: 1.0), for: UIControlState.selected)
        return btn
    }
    
    @objc fileprivate func scrollCategoryBtnAction(_ sender: UIButton) {
        if let btn = selectedScrollCategoryBtn { btn.isSelected = false }
        sender.isSelected = !sender.isSelected
        selectedScrollCategoryBtn = sender
        /// 重设分类标签状态
        if sender.center.x < bounds.width * 0.5 {
            myScrollview.setContentOffset(CGPoint.zero, animated: true)
        } else if myScrollview.contentSize.width > bounds.width && sender.center.x > bounds.width * 0.5 && sender.center.x < (myScrollview.contentSize.width - bounds.width * 0.5) {
            myScrollview.setContentOffset(CGPoint(x: sender.frame.origin.x + sender.bounds.width * 0.5 - bounds.width * 0.5, y: 0), animated: true)
        } else {
            myScrollview.setContentOffset(CGPoint(x: max(myScrollview.contentSize.width - myScrollview.bounds.size.width, 0), y: 0), animated: true)
        }
        /// 重新调用layoutSubviews
        setNeedsLayout()
        delegate?.selectedIndex(sender.tag)
    }
    
    /**
     选择分类按钮
     
     - parameter index: 按钮索引
     */
    func scrollCategoryBtnByIndex(_ index: NSInteger) {
        
        print("index=\(index)")
        if cacheScrollCategoryBtns.count > 0{
        scrollCategoryBtnAction(cacheScrollCategoryBtns[index])
        }
    }
    // MARK: - 懒加载
    fileprivate var scrollBottomLineView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 251.0/255.0, green: 45.0/255.0, blue: 71.0/255.0, alpha: 1.0)
        return view
    }()
}
