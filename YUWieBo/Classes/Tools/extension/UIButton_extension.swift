//
//  UIButton_extension.swift
//  YUWieBo
//
//  Created by 游宗翰 on 2016/9/8.
//  Copyright © 2016年 han. All rights reserved.
//

import UIKit

extension UIButton {
    /*
    class func createButton(imageName:String, backgroundName:String) -> UIButton{
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: imageName), for: .normal)
        button.setBackgroundImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
        button.setImage(UIImage(named: backgroundName), for: .normal)
        button.setImage(UIImage(named: backgroundName + "_highlighted"), for: .highlighted)
        button.sizeToFit()
        
        return button
    }
     */
    
    convenience init(imageName:String, backgroundName:String) {
        
        self.init()
        
        self.setImage(UIImage(named: imageName), for: .normal)
        self.setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
        self.setBackgroundImage(UIImage(named: backgroundName), for: .normal)
        self.setBackgroundImage(UIImage(named: backgroundName + "_highlighted"), for: .highlighted)
        self.sizeToFit()
    }
    
    convenience init(imageName:String) {
        self.init()
        
        self.setImage(UIImage(named: imageName), for: .normal)
        self.setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
        self.sizeToFit()
    }
}
