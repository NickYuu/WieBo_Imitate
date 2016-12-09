//
//  PicCollectionView.swift
//  YUWieBo
//
//  Created by 游宗翰 on 2016/9/24.
//  Copyright © 2016年 han. All rights reserved.
//

import UIKit

class PicCollectionView: UICollectionView {

    // MARK:- 屬性
    var picUrls: [NSURL] = [NSURL]() {
        didSet {
            self.reloadData()
        }
    }
    
    // MARK:- 系統調用函式
    override func awakeFromNib() {
        super.awakeFromNib()
        
        dataSource = self
    }

}

// MARK:- collectionView  DataSource
extension PicCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return picUrls.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        // 獲取cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "picCell", for: indexPath) as! PicCollectionViewCell
        
        // 設置cell數據
        cell.picUrl = picUrls[indexPath.item]
        
        return cell
    }
}

class PicCollectionViewCell: UICollectionViewCell {
    
    // MARK:- 定義模型屬性
    var picUrl : NSURL? {
        didSet {
            guard let picUrl = picUrl else { return }
            iconView.sd_setImage(with: picUrl as URL, placeholderImage:  UIImage(named: "empty_picture"))
        }
    }
    
    // MARK:- 元件屬性
    @IBOutlet weak var iconView: UIImageView!
    
}



