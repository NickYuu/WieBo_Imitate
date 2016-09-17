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
        
        UIView.animate(withDuration: 1.8, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: [], animations: {
            self.view.layoutIfNeeded()
            }){ (_) in
                UIApplication.shared.keyWindow?.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
            }
    }
}
