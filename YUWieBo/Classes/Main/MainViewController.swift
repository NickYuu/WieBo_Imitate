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
    lazy var imageName = ["tabbar_home", "tabbar_message_center", "", "tabbar_discover", "tabbar_profile"]
    lazy var composeButton : UIButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupComposeButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupTabBarItems()
    }
}

// MARK:- 設置UI介面
extension MainViewController {
    
    /// 設置發布按鈕
    func setupComposeButton() {
        composeButton.setBackgroundImage(UIImage(named: "tabbar_compose_button"), for: .normal)
        composeButton.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), for: .highlighted)
        composeButton.setImage(UIImage(named: "tabbar_compose_icon_add"), for: .normal)
        composeButton.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), for: .highlighted)
        composeButton.sizeToFit()
        composeButton.center = CGPoint(x: tabBar.center.x, y: tabBar.bounds.height/2)
        
        tabBar.addSubview(composeButton)
    }
    
    /// 調整TabBar中的Item
    func setupTabBarItems() {
        // MARK:- 增加tabBar選中圖片
        // 獲取所有Item
        for i in 0..<tabBar.items!.count{
            
            // 獲取Item
            let item = tabBar.items![i]
            
            // 設置中間Item不可使用
            if i==2 {
                item.isEnabled = false
                continue
            }
            // 設置其他Item選中的圖片
            item.selectedImage = UIImage(named: imageName[i] + "_highlighted")
        }
    }
}

