//
//  VisitorView.swift
//  YUWieBo
//
//  Created by 游宗翰 on 2016/9/9.
//  Copyright © 2016年 han. All rights reserved.
//

import UIKit

class VisitorView: UIView {
    
    // MARK:- 通過Xib創建View
    class func createViewFromXib() -> VisitorView{
        return Bundle.main.loadNibNamed("VisitorView", owner: nil, options: nil)!.first as! VisitorView
    }
    
    // MARK:- IBOutlet屬性
    @IBOutlet weak var rotationView: UIImageView!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    // MARK:- 自訂函式
    func setupVisitorView(_ iconName:String, tipText:String){
        self.iconView.image = UIImage(named: iconName)
        self.tipLabel.text = tipText
        rotationView.isHidden = true
    }
    
    func addRotationAnim() {
        // 創建動畫
        let rotationAnim = CABasicAnimation(keyPath: "transform.rotation.z")
        
        // 設置動畫屬性
        rotationAnim.fromValue = 0
        rotationAnim.toValue = M_PI * 2
        rotationAnim.repeatCount = MAXFLOAT
        rotationAnim.duration = 5
        rotationAnim.isRemovedOnCompletion = false
        
        // 將動畫加到layer中
        self.rotationView.layer.add(rotationAnim, forKey: nil)
    }
    
    
}
