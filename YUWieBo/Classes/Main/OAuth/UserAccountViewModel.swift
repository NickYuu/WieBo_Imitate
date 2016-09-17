//
//  UserAccountViewModel.swift
//  YUWieBo
//
//  Created by 游宗翰 on 2016/9/17.
//  Copyright © 2016年 han. All rights reserved.
//

import UIKit


class UserAccountViewModel {
    
    // MARK:- 将类设计成单例
    static let shareIntance : UserAccountViewModel = UserAccountViewModel()
    
    // MARK:- 定义属性
    var account : UserAccount?
    
    // MARK:- 计算属性
    var accountPath : String {
        var accountPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        accountPath += "/accout.plist"
        YULog(accountPath)
        return accountPath
    }
    
    var isLogin : Bool {
        if account == nil {
            return false
        }
        
        guard let expiresDate = account?.expires_date else {
            return false
        }
        
        return expiresDate.compare(Date()) == ComparisonResult.orderedDescending
    }
    
    // MARK:- 重写init()函数
    init () {
        // 1.从沙盒中读取中归档的信息
        account = NSKeyedUnarchiver.unarchiveObject(withFile: accountPath) as? UserAccount
    }
}
