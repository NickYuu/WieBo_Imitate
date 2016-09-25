//
//  UserAccountViewModel.swift
//  YUWieBo
//
//  Created by 游宗翰 on 2016/9/17.
//  Copyright © 2016年 han. All rights reserved.
//

import UIKit


class UserAccountViewModel {
    
    // MARK:- 設置單例
    static let shareIntance : UserAccountViewModel = UserAccountViewModel()
    
    // MARK:- 屬性
    var account : UserAccount?
    
    // MARK:- 計算屬性
    var accountPath : String {
        var accountPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        accountPath += "/accout.plist"
        // YULog(accountPath)
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
    
    // MARK:- 重寫init()
    init () {
        // 讀取歸檔的訊息
        account = NSKeyedUnarchiver.unarchiveObject(withFile: accountPath) as? UserAccount
    }
}
