//
//  CustomProgress.swift
//  CustomProgress
//
//  Created by Liu Chuan on 16/7/18.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit

/// 自定义进度条
class CustomProgress: UIView {
    
    
    // MARK: - Lazy Loading
    
    /// 左边的图片
    public lazy var leftImage: UIImageView = {
        let leftImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 0, height: frame.size.height))
        leftImage.layer.borderColor = UIColor.clear.cgColor
        leftImage.layer.borderWidth = 1
        leftImage.layer.cornerRadius = 5
        leftImage.layer.masksToBounds = true
        return leftImage
    }()
    
    /// 显示百分比标签
    public lazy var presentLabel: UILabel = {
        let presentLabel = UILabel(frame: bounds)
        presentLabel.textAlignment = .center
        presentLabel.textColor = UIColor.white
        presentLabel.font = UIFont.systemFont(ofSize: 16)
        return presentLabel
    }()
    
    /// 记录最大值
    public var maxValue: Float = 0.0
    
   
    // MARK: - 初始化
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 5
        layer.masksToBounds = true
        addSubview(leftImage)
        addSubview(presentLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Method
extension CustomProgress {
    
    /// 设置百分比
    ///
    /// - Parameter currentValue: 当前数值
    public func setPresent(_ currentValue: Int) {
        presentLabel.text = "\(currentValue)%"
        leftImage.frame = CGRect(x: 0, y: 0, width: frame.size.width / CGFloat(maxValue) * CGFloat(currentValue), height: frame.size.height)
        print(leftImage.frame)
    }
}
