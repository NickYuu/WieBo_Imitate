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


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        UITabBar.appearance().tintColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        
        return true
    }


}

// MARK:- YULog
/*
 1. 添加在 AppDelegate.swift 最下面為全域函式
 2. 在TARGETS -> Build Setting 搜尋Swift Flags
 3. Debug中添加 -D DEBUG
 */
func YULog<T>(messsage : T, file : String = #file, funcName : String = #function, lineNum : Int = #line) {
    
    #if DEBUG
        
        let fileName = (file as NSString).lastPathComponent
        
        print("文件名:\(fileName)行數:\(lineNum) -『\(messsage)』")
        
    #endif
}

