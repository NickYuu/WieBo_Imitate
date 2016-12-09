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
    var isLogin: Bool = UserAccountViewModel.shareIntance.isLogin
    
    // MARK:- 系統回調函式
    override func loadView() {
        // 判斷要加載哪一個View
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
        visitorView.registerButton.addTarget(self, action: #selector(BaseViewController.registerBtnClick), for: .touchUpInside)
        visitorView.loginButton.addTarget(self, action: #selector(BaseViewController.loginBtnClick), for: .touchUpInside)
    }
    
    /// 設置NavigetionItems
    fileprivate func setupNavigetionItems() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "註冊", style: .plain, target: self, action: #selector(BaseViewController.registerBtnClick))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登入", style: .plain, target: self, action: #selector(BaseViewController.loginBtnClick))
    }
    
}

// MARK:- 事件監聽
extension BaseViewController {
    @objc fileprivate func registerBtnClick() {
        YULog("registerBtnClick")
    }
    
    @objc fileprivate func loginBtnClick() {
        // 創建OAuthViewController
        let oAuthVC = OAuthViewController()
        
        // 添加UINavigationController
        let oAuthNav = UINavigationController(rootViewController:  oAuthVC)
        
        // 彈出Controller
        present(oAuthNav, animated: true, completion: nil)
    }
    
}
