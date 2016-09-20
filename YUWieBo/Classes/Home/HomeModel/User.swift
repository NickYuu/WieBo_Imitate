//
//  User.swift
//  YUWieBo
//
//  Created by 游宗翰 on 2016/9/18.
//  Copyright © 2016年 han. All rights reserved.
//

import UIKit

class User: NSObject {

    // MARK:- 屬性
    var profile_image_url : String?         // 頭像
    var screen_name : String?               // 暱稱
    var verified_type : Int = -1 {           // Vip
        didSet {
            switch verified_type {
            case 0:
                verifiedImage = UIImage(named: "avatar_vip")
            case 2, 3, 5:
                verifiedImage = UIImage(named: "avatar_enterprise_vip")
            case 220:
                verifiedImage = UIImage(named: "avatar_grassroot")
            default:
                verifiedImage = nil
            }
        }
    }
    
    var mbrank : Int = 0 {                   // 會員等級
        didSet {
            if mbrank > 0 && mbrank <= 6 {
                vipImage = UIImage(named: "common_icon_membership_level\(mbrank)")
            }
        }
    }
    
    
    // MARK:- 對用數據處理
    var verifiedImage : UIImage?
    var vipImage : UIImage?

    
    // MARK:- 自定構造函式
    init(dict : [String : AnyObject]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
    
}
