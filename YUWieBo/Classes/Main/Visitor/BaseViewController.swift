//
//  BaseViewController.swift
//  YUWieBo
//
//  Created by 游宗翰 on 2016/9/9.
//  Copyright © 2016年 han. All rights reserved.
//

import UIKit

class BaseViewController: UITableViewController {

    // MARK:- 延遲加載屬性
    lazy var visitorView = VisitorView.createViewFromXib()
    
    // MARK:- 定義變量
    var isLogin = true
    
    // MARK:- 系統自調函式
    override func loadView() {
        isLogin ? super.loadView() : setupVisitorView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigetionItems()
        
    }

}

// MARK:- 設置UI介面
extension BaseViewController {
    /// 未登入視圖
    fileprivate func setupVisitorView() {
        self.view = visitorView
        visitorView.registerButton.addTarget(self, action: #selector(BaseViewController.letBarButtonClick), for: .touchUpInside)
        visitorView.loginButton.addTarget(self, action: #selector(BaseViewController.rightBarButtonClick), for: .touchUpInside)
    }
    
    /// 設置NavigetionItems
    fileprivate func setupNavigetionItems() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "註冊", style: .plain, target: self, action: #selector(BaseViewController.letBarButtonClick))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登入", style: .plain, target: self, action: #selector(BaseViewController.rightBarButtonClick))
    }
    
}

// MARK:- 事件監聽
extension BaseViewController {
    @objc fileprivate func letBarButtonClick() {
        YULog(messsage: "letBarButtonClick")
    }
    
    @objc fileprivate func rightBarButtonClick() {
        YULog(messsage: "rightBarButtonClick")
    }
    
}
