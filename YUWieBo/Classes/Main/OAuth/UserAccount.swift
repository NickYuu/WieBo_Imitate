//
//  UserAccount.swift
//  YUWieBo
//
//  Created by 游宗翰 on 2016/9/16.
//  Copyright © 2016年 han. All rights reserved.
//

import UIKit

class UserAccount: NSObject {
    
    // MARK:- 屬性
    /// 授權AccessToken
    var access_token : String?
    
    /// 過期時間->秒
    var expires_in : TimeInterval = 0.0{
        didSet {
            expires_date = NSDate(timeIntervalSinceNow: expires_in)
        }
    }
    /// 用戶ID
    var uid : String?
    
    /// 过期日期
    var expires_date : NSDate?
    
    /// 昵称
    var screen_name : String?
    
    /// 用户的头像地址
    var avatar_large : String?
    
    // MARK:- 自定構造函式
    init(dict : [String : Any]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    
    // 重寫setValue方法-（kvc不用所有key）
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
    
    // MARK:- 重寫description屬性
    override var description : String {
        
        return dictionaryWithValues(forKeys: ["access_token", "expires_date", "uid", "screen_name", "avatar_large"]).description
        
    }
}
