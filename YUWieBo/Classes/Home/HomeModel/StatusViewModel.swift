//
//  StatusViewModel.swift
//  YUWieBo
//
//  Created by 游宗翰 on 2016/9/18.
//  Copyright © 2016年 han. All rights reserved.
//

import UIKit

class StatusViewModel: NSObject {

    var status : Status?
    
    // 對數據處理的屬性
    var sourceText : String?
    var createAtText : String?
    var verifiedImage : UIImage?
    var vipImage : UIImage?
    var profileUrl : URL?
    var picURLs : [NSURL] = [NSURL]()
    
    
    init(status:Status) {
        self.status = status
        
        // sourceText
        if let source = status.source , source != "" {
            let startLocation = source.range(of: ">")?.upperBound
            let endLocation = source.range(of: "</")?.lowerBound
            let range:Range = Range.init(uncheckedBounds: (startLocation!, endLocation!))
            sourceText = source.substring(with: range)
        }
        
        // createAtText
        if let created_at = status.created_at {
            // 對時間處理-自定類方法-NSDate-Extension
            createAtText = Date.createDateString(createAtStr: created_at)
        }
        
        // verifiedImage
        let verifedType = status.user?.verified_type ?? -1
        switch verifedType {
        case 0:
            verifiedImage = UIImage(named: "avatar_vip")
        case 2, 3, 5:
            verifiedImage = UIImage(named: "avatar_enterprise_vip")
        case 220:
            verifiedImage = UIImage(named: "avatar_grassroot")
        default:
            verifiedImage = nil
        }
        
        // vipImage
        let mbrank = status.user?.mbrank ?? 0
        if mbrank > 0 && mbrank <= 6 {
            vipImage = UIImage(named: "common_icon_membership_level\(mbrank)")
        }
        
        // profileUrl
        let profileUrlString = status.user?.profile_image_url ?? ""
        profileUrl = URL(string: profileUrlString)
        
        // 處理配圖數據
        if let picURLDicts = status.pic_urls {
            for picURLDict in picURLDicts {
                guard let picURLString = picURLDict["thumbnail_pic"] else {
                    continue
                }
                picURLs.append(NSURL(string: picURLString)!)
            }
        }
    }
}
