//
//  HomeViewController.swift
//  YUWieBo
//
//  Created by 游宗翰 on 2016/9/8.
//  Copyright © 2016年 han. All rights reserved.
//

import UIKit
import SDWebImage

class HomeViewController: BaseViewController {
    
    // MARK:- 屬性
    
    
    // MARK:- 延遲加載屬性
    fileprivate lazy var titleBtn : TitleButton = TitleButton()
    fileprivate lazy var popoverAnimator : PopoverAnimator = PopoverAnimator {[weak self] (isPresented) in
        self?.titleBtn.isSelected = isPresented
    }
    fileprivate lazy var viewModels : [StatusViewModel] = [StatusViewModel]()
    
    // MARK:- 系統調用函式
    override func viewDidLoad() {
        super.viewDidLoad()
        
        visitorView.addRotationAnim()
        
        // 沒有登入時
        if !isLogin{
            return
        }
        
        // 有登入
        setupNavigationBar()
        
        // 請求數據
        loadStatuses()
        
        tableView.estimatedRowHeight = 220
        // tableView.rowHeight = UITableViewAutomaticDimension
        
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
        titleBtn.setTitle("DeveloperYU", for: .normal)
        titleBtn.addTarget(self, action: #selector(HomeViewController.titleButtonClick(_:)), for: .touchUpInside)
        navigationItem.titleView = titleBtn
        
        // 彈出視窗的尺寸
        popoverAnimator.presentedFrame = CGRect(x: screenSize.width*0.5 - screenSize.width*0.48/2, y: 55, width: screenSize.width*0.48, height: screenSize.height*0.38)
        
    }
}

// MARK:- 事件監聽
extension HomeViewController {
    @objc fileprivate func titleButtonClick(_ titleBtn:TitleButton) {
        
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

// MARK:- 加載首頁數據
extension HomeViewController {
    fileprivate func loadStatuses() {
        NetworkTools.shareInstance.loadStatuses { (result, err) in
            if err != nil {
                YULog(err)
                return
            }
            guard let resultArray = result else {
                return
            }
            for statusDic in resultArray {
                let status = Status(dic: statusDic)
                let viewModel = StatusViewModel(status: status)
                self.viewModels.append(viewModel)
            }
            // 緩存圖片
            self.cacheImages(self.viewModels)
        }
    }
    
    private func cacheImages(_ viewModels : [StatusViewModel]) {
        // 創建group
        let group = DispatchGroup()
        
        // 緩存圖片
        for viewmodel in viewModels {
            for picURL in viewmodel.picURLs {
                group.enter()
                SDWebImageManager.shared().downloadImage(with: picURL as URL!, options: [], progress: nil, completed: { (_, _, _, _, _) -> Void in
                    group.leave()
                })
            }
        }
        
        // 2.刷新表格
        group.notify(queue: DispatchQueue.main) {
            self.tableView.reloadData()
        }
    }
}

// MARK:- tableView Delegate DataSource
extension HomeViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCell") as! HomeViewCell
        
        let viewModel = viewModels[indexPath.row]
        cell.viewModel = viewModel
        
        
        return cell
    }
}


