//
//  TitleButton.swift
//  YUWieBo
//
//  Created by 游宗翰 on 2016/9/9.
//  Copyright © 2016年 han. All rights reserved.
//

import UIKit

class TitleButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setImage(UIImage(named: "navigationbar_arrow_down"), for: .normal)
        setImage(UIImage(named: "navigationbar_arrow_up"), for: .selected)
        setTitleColor(.black, for: .normal)
        sizeToFit()
    }
    required init?(coder aDecoder: NSCoder) {
        self.init()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.titleLabel!.frame.origin.x = 0
        self.imageView!.frame.origin.x = self.titleLabel!.frame.size.width + 10
    }

}
