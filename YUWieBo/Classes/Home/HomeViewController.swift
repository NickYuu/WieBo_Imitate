//
//  HomeViewController.swift
//  YUWieBo
//
//  Created by 游宗翰 on 2016/9/8.
//  Copyright © 2016年 han. All rights reserved.
//

import UIKit

class HomeViewController: BaseViewController {
    
    // MARK:- 屬性
    
    
    // MARK:- 延遲加載屬性
    fileprivate lazy var titleBtn : TitleButton = TitleButton()
    fileprivate lazy var popoverAnimator : PopoverAnimator = PopoverAnimator {[weak self] (isPresented) in
        self?.titleBtn.isSelected = isPresented
    }
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
        
        // 螢幕尺寸
        let screenSize =  UIScreen.main.bounds
        
        // 左邊BarButton
        navigationItem.leftBarButtonItem = UIBarButtonItem(imageName: "navigationbar_friendattention")
        
        // 右邊BarButton
        navigationItem.rightBarButtonItem = UIBarButtonItem(imageName: "navigationbar_pop")
        
        // 中間titleView
        titleBtn.setTitle("ＹＵ", for: .normal)
        titleBtn.addTarget(self, action: #selector(HomeViewController.titleButtonClick(titleBtn:)), for: .touchUpInside)
        navigationItem.titleView = titleBtn
        
        // 彈出視窗的尺寸
        popoverAnimator.presentedFrame = CGRect(x: screenSize.width*0.5 - screenSize.width*0.48/2, y: 55, width: screenSize.width*0.48, height: screenSize.height*0.38)
        
    }
}


// MARK:- 事件監聽
extension HomeViewController {
    @objc fileprivate func titleButtonClick(titleBtn:TitleButton) {
        
        // 改變點擊狀態
        //titleBtn.isSelected = !titleBtn.isSelected
        
        // 創建一個彈出視窗
        let vc = PopoverViewController()
        
        // 推出視窗的樣式
        vc.modalPresentationStyle = .custom
        
        // 設置轉場代理
        vc.transitioningDelegate = popoverAnimator
        
        // 推出視窗 
        present(vc, animated: true, completion: nil)
    }
}





