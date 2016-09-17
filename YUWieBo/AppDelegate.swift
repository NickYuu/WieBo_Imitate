//
//  AppDelegate.swift
//  YUWieBo
//
//  Created by 游宗翰 on 2016/9/8.
//  Copyright © 2016年 han. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var defaultViewController : UIViewController? {
        let isLogin = UserAccountViewModel.shareIntance.isLogin
        return isLogin ? WelcomeViewController() : UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
    }


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // 設置全局UITabBar、UINavigationBar顏色
        UITabBar.appearance().tintColor = #colorLiteral(red: 1, green: 0.5106488466, blue: 0.002952917945, alpha: 1)
        UINavigationBar.appearance().tintColor = #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
        
        // 創建window
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = defaultViewController
        window?.makeKeyAndVisible()
        
        return true
    }


}

// MARK:- YULog
/*
 1. 添加在 AppDelegate.swift 最下面為全域函式
 2. 在TARGETS -> Build Setting 搜尋Swift Flags
 3. Debug中添加 -D DEBUG
 */
func YULog<T>(_ messsage : T, file : String = #file, funcName : String = #function, lineNum : Int = #line) {
    
    #if DEBUG
        
        let fileName = (file as NSString).lastPathComponent
        
        print("文件名:\(fileName)行數:\(lineNum) -『\(messsage)』")
        
    #endif
}

