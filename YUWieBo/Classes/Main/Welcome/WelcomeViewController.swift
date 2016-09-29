//
//  WelcomeViewController.swift
//  YUWieBo
//
//  Created by 游宗翰 on 2016/9/17.
//  Copyright © 2016年 han. All rights reserved.
//

import UIKit
import SDWebImage

class WelcomeViewController: UIViewController {

    @IBOutlet weak var iconViewBottomCons: NSLayoutConstraint!
    @IBOutlet weak var iconView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let profileUrlString = UserAccountViewModel.shareIntance.account?.avatar_large
        let url = URL(string: profileUrlString ?? "")
        
        iconView.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "avatar_default_big"))
        
        
        iconViewBottomCons.constant = UIScreen.main.bounds.height - 200
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UIView.animate(withDuration: 1.5, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 5.0, options: [], animations: { () -> Void in
            self.view.layoutIfNeeded()
        }) { (_) -> Void in
            // 改成從Main.storyboard加載
            UIApplication.shared.keyWindow?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
        }
        
    }
    
}
