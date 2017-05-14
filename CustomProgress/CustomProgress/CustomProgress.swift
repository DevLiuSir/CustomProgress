//
//  CustomProgress.swift
//  CustomProgress
//
//  Created by Liu Chuan on 16/7/18.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit

// MARK: - 自定义进度条
class CustomProgress: UIView {
    
    /// 左边的图片
    var leftImage: UIImageView!
    /// 背景图片
    var backgroundImage: UIImageView!
    /// 显示百分比标签
    var presentLabel: UILabel!
    /// 记录最大值
    var maxValue: Float = 0.0
    
   
    // MARK: - 自定义构造函数
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        self.backgroundColor = UIColor.clear
        
        /// 背景图片
        backgroundImage = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height))
        backgroundImage.layer.borderColor = UIColor.clear.cgColor
        backgroundImage.layer.borderWidth = 1
        backgroundImage.layer.cornerRadius = 5
        backgroundImage.layer.masksToBounds = true
        
        // 左边的图片
        leftImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 0, height: frame.size.height))
        leftImage.layer.borderColor = UIColor.clear.cgColor
        leftImage.layer.borderWidth = 1
        leftImage.layer.cornerRadius = 5
        leftImage.layer.masksToBounds = true
        
        
        // 显示百分比标签
        presentLabel = UILabel(frame: (backgroundImage?.bounds)!)
        presentLabel.textAlignment = .center
        presentLabel.textColor = UIColor.white
        presentLabel.font = UIFont.systemFont(ofSize: 16)
        
        
        addSubview(backgroundImage)
        addSubview(leftImage)
        addSubview(presentLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    func setPresent(_ currentValue: Int) {
        
        presentLabel.text = "\(currentValue)%"
        
        leftImage.frame = CGRect(x: 0, y: 0, width: frame.size.width / CGFloat(maxValue) * CGFloat(currentValue), height: frame.size.height)

        print(leftImage.frame)
    }
    
}
