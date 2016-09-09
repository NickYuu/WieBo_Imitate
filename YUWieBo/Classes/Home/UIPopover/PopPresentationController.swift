//
//  PopPresentationController.swift
//  YUWieBo
//
//  Created by 游宗翰 on 2016/9/9.
//  Copyright © 2016年 han. All rights reserved.
//

import UIKit

class PopPresentationController: UIPresentationController {
    
    // MARK:- 延遲加載屬性
    fileprivate lazy var coverView = UIView()
    
    /// MARK:- 系統調用函示
    override func containerViewWillLayoutSubviews() {
        
        // 螢幕尺寸
        let screenSize =  UIScreen.main.bounds
        
        // 設置POP尺寸位置
        presentedView?.frame = CGRect(x: screenSize.width*0.5 - screenSize.width*0.45/2, y: 55, width: screenSize.width*0.45, height: screenSize.height*0.3)

        // 添加一個霧化背景
        setupCoverView()
    }
    
}

// MARK:- 設置UI界面
extension PopPresentationController {
    fileprivate func setupCoverView() {
        
        // 添加一個霧化背景
        containerView?.insertSubview(coverView, at: 0)
        coverView.backgroundColor = UIColor(white: 0.8, alpha: 0.5)
        coverView.frame = containerView!.bounds
        
        // 給霧化背景添加點擊手勢
        let tapGes = UITapGestureRecognizer(target: self, action: #selector(PopPresentationController.tapRecognizer))
        coverView.addGestureRecognizer(tapGes)
    }
}

// MARK:- 事件監聽 
extension PopPresentationController {
    /// 點擊事件
    @objc fileprivate func tapRecognizer() {
        presentedViewController.dismiss(animated: true, completion: nil)
    }
}




