//
//  OAuthViewController.swift
//  YUWieBo
//
//  Created by 游宗翰 on 2016/9/16.
//  Copyright © 2016年 han. All rights reserved.
//

import UIKit
import SVProgressHUD

class OAuthViewController: UIViewController {
    
    // MARK:- 元件的属性
    @IBOutlet weak var webView: UIWebView!

    // MARK:- 系統回調函式
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK:- 設置navigationItem
        setupNavigationBar()
        
        // MARK:- 載入網頁
        loadPage()
    }

}

// MARK:- 設置UI界面相關
extension OAuthViewController {
    fileprivate func setupNavigationBar() {
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "取消", style: .plain, target: self, action: #selector(OAuthViewController.closeItemClick))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "填寫", style: .plain, target: self, action: #selector(OAuthViewController.fillItemClick))
        
        navigationItem.title = "登入"
    }
    
    fileprivate func loadPage() {
        let urlString = "https://api.weibo.com/oauth2/authorize?client_id=\(app_key)&redirect_uri=\(redirect_uri)"
        guard let url = URL(string: urlString) else {
            return
        }
        let urlRequest = URLRequest(url: url)
        
        webView.loadRequest(urlRequest)
    }
}

// MARK:- 事件監聽函式
extension OAuthViewController {
    @objc fileprivate func closeItemClick() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc fileprivate func fillItemClick() {
        // 撰寫JS
        let jsCode = "document.getElementById('userId').value='00886926838881';document.getElementById('passwd').value='ws875421';"
        
        // webView執行JS
        webView.stringByEvaluatingJavaScript(from: jsCode)
    }
    
}

// MARK:- webView的delegate方法
extension OAuthViewController : UIWebViewDelegate {
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        SVProgressHUD.show(withStatus: "載入中")
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        SVProgressHUD.dismiss()
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        SVProgressHUD.dismiss()
    }
    
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        // 獲取加載網頁的url
        guard let url = request.url else {
            return true
        }
        // 將url轉為string
        let urlString = url.absoluteString
        
        // 判斷字串是否包含"code="
        guard urlString.contains("code=") else {
            return true
        }
        // 取得"code="之後的字串（授權碼）
        let code = urlString.components(separatedBy: "code=").last!
        
        loadAccessToken(code: code)
        
        return false
    }
}



// MARK:- 請求數據
extension OAuthViewController {
    /// 請求AccessToken
    fileprivate func loadAccessToken(code : String) {
        NetworkTools.shareInstance.loadAccessToken(code: code) { (result, error) -> () in
            
            if error != nil {
                YULog(error)
                return
            }
            
            YULog(result)
        }
    }
}



