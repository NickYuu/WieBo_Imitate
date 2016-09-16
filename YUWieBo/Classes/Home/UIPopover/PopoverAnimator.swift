//
//  PopoverAnimator.swift
//  YUWieBo
//
//  Created by 游宗翰 on 2016/9/10.
//  Copyright © 2016年 han. All rights reserved.
//

import UIKit

class PopoverAnimator: NSObject {
    // MARK:- 對外公開的屬性
    var isPresented = false
    var presentedFrame : CGRect = CGRect.zero
    
    var callBack : ((_ isPresented:Bool)->())?
    
    init(callBack : @escaping ((_ isPresented:Bool)->())) {
        self.callBack = callBack
    }
}


// MARK:- 轉場Delegate的方法
extension PopoverAnimator : UIViewControllerTransitioningDelegate {
    
    /// 改變彈出view的尺寸
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        
        let presentation =  PopPresentationController(presentedViewController: presented, presenting: presenting)
        
        presentation.presentedFrame = presentedFrame
        
        return presentation
    }
    
    /// 自定義彈出的動畫
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresented = true
        callBack!(isPresented)
        
        return self
    }
    
    /// 自定義消失的動畫
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        isPresented = false
        callBack!(isPresented)
        
        return self
    }
}

// MARK:- 彈出和消失動畫代理的方法
extension PopoverAnimator : UIViewControllerAnimatedTransitioning {
    
    /// 動畫執行的時間
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    /*
     transitionContext.view(forKey: UITransitionContextViewKey.to)
     Currently only two keys are defined by the system -
     UITransitionContextFromViewKey, and UITransitionContextToViewKey
     // UITransitionContextFromViewKey : 獲取消失的View
     // UITransitionContextToViewKey : 獲取彈出的View
     */
    
    /// 可以通過transitionContext獲取彈出的View和消失的View
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        isPresented ? animationForPresentedView(using: transitionContext) : animatiomForDismissedView(using: transitionContext)
    }
    
    /// 自定義彈出動畫
    fileprivate func animationForPresentedView(using transitionContext: UIViewControllerContextTransitioning){
        
        // 獲取彈出的View
        let presentedView = transitionContext.view(forKey: UITransitionContextViewKey.to)!
        
        // 將彈出的View添加到containerView中
        transitionContext.containerView.addSubview(presentedView)
        
        // 執行動畫
        presentedView.transform = CGAffineTransform(scaleX: 1, y: 0)
        presentedView.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
        
        UIView.animate(
            withDuration: transitionDuration(using: transitionContext),
            animations: {
                presentedView.transform = CGAffineTransform.identity
            })
        {
            if $0{
                transitionContext.completeTransition(true)
            }
        }
    }
    
    // 自定義消失動畫
    fileprivate func animatiomForDismissedView(using transitionContext: UIViewControllerContextTransitioning){
        
        // 獲取消失的View
        let dismissView = transitionContext.view(forKey: UITransitionContextViewKey.from)
        
        // 執行動畫
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            dismissView?.transform = CGAffineTransform(scaleX: 1.0, y: 0.000001)
        }) { (_) in
            dismissView?.removeFromSuperview()
            transitionContext.completeTransition(true)
        }
        
    }
    
}
