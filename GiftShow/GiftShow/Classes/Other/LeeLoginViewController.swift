//
//  LeeLoginViewController.swift
//  GiftShow
//
//  Created by admin on 16/10/24.
//  Copyright © 2016年 Mr_LeeKi. All rights reserved.
//

import UIKit

class LeeLoginViewController: UIViewController {

    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var useBtnMessage: UIButton!
    @IBOutlet weak var valBtn: UIButton!
    @IBOutlet weak var passwordTextFiled: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passWordImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
          setupUI()
    }

    @IBAction func back(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }

 
    fileprivate func setupUI(){
     valBtn.isHidden = true
     valBtn.layer.cornerRadius = 3
        loginBtn.layer.cornerRadius = 5
     
    }
    //使用验证码登录按钮点击
    @IBAction func valMessageBtnClick(_ sender: UIButton) {
       
        sender.isSelected =  !sender.isSelected
        
        if sender.isSelected {
            useBtnMessage .setTitle("使用密码登录", for: UIControlState())
            valBtn.isHidden = false
            passWordImage.image = UIImage(named: "icon_signin_message")
            passwordTextFiled.placeholder = "请输入验证码"
        }else {
            valBtn.isHidden = true
            passWordImage.image = UIImage(named: "icon_signin_password")
            passwordTextFiled.placeholder = "请输入密码"
            useBtnMessage .setTitle("使用验证码登录", for: UIControlState())
         }
        
    }
    //登录按钮点击
    @IBAction func loginBtnClick(_ sender: UIButton) {
        
        print("登录点击")
    }
    //获取验证码点击
    @IBAction func getValMessageClick(_ sender: UIButton) {
        
        print("验证码获取")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
