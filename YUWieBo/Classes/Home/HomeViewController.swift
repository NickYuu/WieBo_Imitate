//
//  HomeViewController.swift
//  YUWieBo
//
//  Created by 游宗翰 on 2016/9/8.
//  Copyright © 2016年 han. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    // MARK:- 延遲加載屬性
    lazy var titleBtn : TitleButton = TitleButton()
    
    // MARK:- 系統調用函示
    override func viewDidLoad() {
        super.viewDidLoad()

        // 沒有登入時
        visitorView.addRotationAnim()
        if !isLogin{
            return
        }
        
        // 有登入
        setupNavigationBar()
    }
}

// MARK:- 設置UI介面
extension HomeViewController {
    fileprivate func setupNavigationBar() {
        
        // 左邊BarButton
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "navigationbar_friendattention")
        
        // 右邊BarButton
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "navigationbar_pop")
        
        // 中間titleView
        titleBtn.setTitle("ＹＵ", for: .normal)
        titleBtn.addTarget(self, action: #selector(HomeViewController.titleButtonClick(titleBtn:)), for: .touchUpInside)
        navigationItem.titleView = titleBtn
        
    }
}


// MARK:- 事件監聽
extension HomeViewController {
    @objc fileprivate func titleButtonClick(titleBtn:TitleButton) {
        // 改變點擊狀態
        titleBtn.isSelected = !titleBtn.isSelected
        
        // 創建一個彈出視窗
        let vc = PopoverViewController()
        
        vc.modalPresentationStyle = .custom
        
        // 推出視窗 
        present(vc, animated: true, completion: nil)
    }
}
