//
//  ViewController.swift
//  CustomProgress
//
//  Created by Liu Chuan on 16/7/18.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit

/// 屏幕的宽度
private let screenW: CGFloat = UIScreen.main.bounds.width
/// 屏幕的高度
private let screenH: CGFloat = UIScreen.main.bounds.height
/// 进度条的宽度
private let progressWidth: CGFloat = screenW - 20


class ViewController: UIViewController {
    
    // MARK: - 定义属性
    
    /// 自定义 CustomProgress
    private lazy var customProgress: CustomProgress = {
        let viewFrame = CGRect(x: (screenW - progressWidth) / 2, y: 100, width: progressWidth, height: 50)
        let progress = CustomProgress(frame: viewFrame)
        progress.backgroundColor = UIColor.lightGray
        progress.leftImage.backgroundColor = UIColor.black
        progress.presentLabel.textColor = UIColor.white
        progress.maxValue = 100
        return progress
    }()
    
    /// 定时器
    var timer: Timer?
    
    /// 当前值
    var currentValue: Int = 0
  
    /// 按钮状态
    @IBOutlet weak var ButtonState: UIButton!
    
    
    ///  开始按钮事件
    ///
    /// - Parameter sender: UIButton
    @IBAction func startBtn(_ sender: UIButton) {
        
        // timeInterval: 0.1秒更新一次, timerUpdate:更新方法, repeats: 是否循环
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
    }
    
    
    // MARK: - 视图的生命周期
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
    }
}


// MARK: - Custom Method
extension ViewController {
    
    /// 配置UI界面
    private func configUI() {
        view.backgroundColor = UIColor.white
        view.addSubview(customProgress)
    }
    
    /// 定时器监听事件（更新...）
    @objc private func timerUpdate() {
        
        currentValue += 1
        if currentValue <= 100 {
            customProgress.setPresent(currentValue)
        }else {
            // 失效
            timer?.invalidate()
            timer = nil
            
            // 归零
            currentValue = 0
            
            // 改变按钮\标签的文字
            customProgress.presentLabel.text = "完成"
            ButtonState.titleLabel?.text = "完成"
        }
    }
    
}
