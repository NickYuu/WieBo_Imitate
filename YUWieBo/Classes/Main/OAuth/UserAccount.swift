//
//  UserAccount.swift
//  YUWieBo
//
//  Created by 游宗翰 on 2016/9/16.
//  Copyright © 2016年 han. All rights reserved.
//

import UIKit

class UserAccount: NSObject, NSCoding {
    
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
    
    /// 過期日期 利用expires_in取得
    var expires_date : NSDate?
    
    /// 暱稱
    var screen_name : String?
    
    /// 照片的網址
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
    
    // MARK:- 讀檔＆寫檔
    /// 讀檔的方法
    required init?(coder aDecoder: NSCoder) {
        access_token = aDecoder.decodeObject(forKey: "access_token") as? String
        uid = aDecoder.decodeObject(forKey: "uid") as? String
        expires_date = aDecoder.decodeObject(forKey: "expires_date") as? NSDate
        avatar_large = aDecoder.decodeObject(forKey: "avatar_large") as? String
        screen_name = aDecoder.decodeObject(forKey: "screen_name") as? String
    }
    
    /// 寫檔方法
    func encode(with aCoder: NSCoder) {
        aCoder.encode(access_token, forKey: "access_token")
        aCoder.encode(uid, forKey: "uid")
        aCoder.encode(expires_date, forKey: "expires_date")
        aCoder.encode(avatar_large, forKey: "avatar_large")
        aCoder.encode(screen_name, forKey: "screen_name")
    }
}
