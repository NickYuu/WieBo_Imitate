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
    var isLogin = false
    
    // MARK:- 系統自調函式
    override func loadView() {
        isLogin ? super.loadView() : setupVisitorView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}

extension BaseViewController {
    fileprivate func setupVisitorView() {
        visitorView.backgroundColor = UIColor.magenta
        self.view = visitorView
    }
}
