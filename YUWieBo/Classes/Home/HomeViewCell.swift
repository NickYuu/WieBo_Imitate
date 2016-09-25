//
//  HomeViewCell.swift
//  YUWieBo
//
//  Created by 游宗翰 on 2016/9/18.
//  Copyright © 2016年 han. All rights reserved.
//

import UIKit
import SDWebImage

private let edgeMargin: CGFloat = 15
private let itemMargin: CGFloat = 10

class HomeViewCell: UITableViewCell {

    // MARK:- 元件的屬性
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var verifiedView: UIImageView!
    @IBOutlet weak var screenName: UILabel!
    @IBOutlet weak var vipView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var picView: PicCollectionView!
    
    // MARK:- 約束的屬性
    @IBOutlet weak var contentLabelWCons: NSLayoutConstraint!
    @IBOutlet weak var picViewHCons: NSLayoutConstraint!
    @IBOutlet weak var picViewWCons: NSLayoutConstraint!

    // MARK:- 自定的屬性
    var viewModel : StatusViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            // iconView
            iconView.sd_setImage(with: viewModel.profileUrl, placeholderImage: #imageLiteral(resourceName: "avatar_default_small"))
            
            // verifiedView
            verifiedView.image = viewModel.verifiedImage
            
            // screenName
            screenName.text = viewModel.status?.user?.screen_name
            
            // vipView
            vipView.image = viewModel.vipImage
            
            // timeLabel
            timeLabel.text = viewModel.createAtText
            
            // sourceLabel
            sourceLabel.text = viewModel.sourceText
            
            // contentLabel
            contentLabel.text = viewModel.status?.text
            
            // 暱稱的顏色
            screenName.textColor = viewModel.vipImage == nil ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            
            // 計算picView寬高的約束
            let picViewSize = calculatePicViewSize(count: viewModel.picURLs.count)
            picViewHCons.constant = picViewSize.height
            picViewWCons.constant = picViewSize.width
            
        }
    }
    
    // MARK:- 系統調用
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // 設置內文的寬度
        contentLabelWCons.constant = UIScreen.main.bounds.width - 2 * edgeMargin
        
        // 取出picView對應的layout
        let layout = picView.collectionViewLayout as! UICollectionViewFlowLayout
        let imageViewHW = (UIScreen.main.bounds.width - edgeMargin*2 - itemMargin*2) / 3
        layout.itemSize = CGSize(width: imageViewHW, height: imageViewHW)
    }

}

// MARK:- 計算picView寬高
extension HomeViewCell {
    fileprivate func calculatePicViewSize(count: Int) -> CGSize {
        // 沒有配圖
        if count == 0 {
            return CGSize.zero
        }
        
        // 計算imageView的寬高
        let imageViewHW = (UIScreen.main.bounds.width - edgeMargin*2 - itemMargin*2) / 3
        
        // 四張配圖
        if count == 4 {
            let picViewWH = 2*imageViewHW + itemMargin
            return CGSize(width: picViewWH, height: picViewWH)
        }
        
        // 其他張配圖
        let rows = CGFloat((count - 1) / 3 + 1)
        
        let picViewH = rows * imageViewHW + itemMargin * (rows - 1)
        
        let picViewW = UIScreen.main.bounds.width - 2 * edgeMargin
        
        return CGSize(width: picViewW, height: picViewH)
    }
}

