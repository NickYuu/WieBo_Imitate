//
//  MainViewController.swift
//  YUWieBo
//
//  Created by 游宗翰 on 2016/9/8.
//  Copyright © 2016年 han. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {
    
    // MARK:- 延遲加載屬性 
    fileprivate lazy var composeButton : UIButton = UIButton(imageName: "tabbar_compose_icon_add", backgroundName: "tabbar_compose_button")
    
    // MARK:- 系統調用函式
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupComposeButton()
    }
}

// MARK:- 設置UI介面
extension MainViewController {
    
    /// 設置發布按鈕
    fileprivate func setupComposeButton() {
        // 按鈕位置
        composeButton.center = CGPoint(x: tabBar.center.x, y: tabBar.bounds.height/2)
        // 添加按鈕
        tabBar.addSubview(composeButton)
        
        composeButton.addTarget(self, action: #selector(MainViewController.composeBtnClick), for: .touchUpInside)
    }
}

// MARK:- 事件監聽
extension MainViewController {
    @objc fileprivate func composeBtnClick() {
        YULog(messsage: "點擊")
        
    }
}

