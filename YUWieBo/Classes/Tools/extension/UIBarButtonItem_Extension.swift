//
//  UIBarButtonItem_Extension.swift
//  YUWieBo
//
//  Created by 游宗翰 on 2016/9/9.
//  Copyright © 2016年 han. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    convenience init(imageName : String) {
        self.init(customView : UIButton(imageName: imageName))
    }
}
