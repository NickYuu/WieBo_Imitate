//
//  Status.swift
//  YUWieBo
//
//  Created by 游宗翰 on 2016/9/18.
//  Copyright © 2016年 han. All rights reserved.
//

import UIKit

class Status: NSObject {
    
    // MARK:- 屬性
    var created_at : String?              // 微博創建時間
    var source : String?                  // 微博來源
    var text : String?                    // 微博的正文
    var mid : Int = 0                     // 微博的ID
    var user : User?                      // 用戶資訊
    var pic_urls : [[String : String]]?   // 微博的配圖
    var retweeted_status : Status?        // 轉發的微博
    
    // 自定構造函式
    init(dic:[String:Any]) {
        super.init()
        setValuesForKeys(dic)
        
        // 將用戶字典轉成模型
        if let userDict = dic["user"] as? [String : AnyObject] {
            user = User(dict: userDict)
        }
        
        // 將轉發微博字典轉成模型
        if let retweetedStatusDict = dic["retweeted_status"] as? [String : AnyObject] {
            retweeted_status = Status(dic: retweetedStatusDict)
        }
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
