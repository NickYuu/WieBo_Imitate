//
//  VisitorView.swift
//  YUWieBo
//
//  Created by 游宗翰 on 2016/9/9.
//  Copyright © 2016年 han. All rights reserved.
//

import UIKit

class VisitorView: UIView {
    class func createViewFromXib() -> VisitorView{
        return Bundle.main.loadNibNamed("VisitorView", owner: nil, options: nil)!.first as! VisitorView
    }
}
