//
//  ViewController.swift
//  CustomProgress
//
//  Created by Liu Chuan on 16/7/18.
//  Copyright © 2016年 LC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    // MARK: - 定义属性
    
    /// 自定义 CustomProgress
    var customProgress: CustomProgress?
    
    /// 定时器
    var timer: Timer?
    
    /// 当前值
    var currentValue: Int = 0
  
    /// 按钮状态
    @IBOutlet weak var ButtonState: UIButton!
    
    // MARK: - 系统回调函数
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 配置UI界面
        configUI()
    }

    // MARK: - 配置UI界面
    private func configUI() {
        
        view.backgroundColor = UIColor.white
        
        customProgress = CustomProgress(frame: CGRect(x: 10, y: 100, width: view.frame.size.width - 20, height: 50))
        
        customProgress?.maxValue = 100
        
        // 设置自定义进度条背景色
        customProgress?.backgroundImage?.backgroundColor = UIColor(red: 188/255.0, green: 188/255.0, blue: 188/255.0, alpha: 1)
        
        // 设置左边图片的背景色
        customProgress?.leftImage?.backgroundColor = UIColor.black
    
        // 更改presentLabel字体颜色
        customProgress?.presentLabel?.textColor = UIColor.red
        
        view.addSubview(customProgress!)
  
    }
    
    // MARK: - 开始按钮事件
    @IBAction func startBtn(_ sender: UIButton) {
        
        // MARK: Timer 计时器
        // 0.1秒更新一次, 更新方法, 一直循环
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(timerUpdate), userInfo: nil, repeats: true)
    }
    
    
    
   // MARK: - 监听事件
    @objc private func timerUpdate() {
        
        currentValue += 1
        
        if currentValue <= 100 {
            customProgress!.setPresent(currentValue)
            
        }else {
            // 失效
            timer?.invalidate()
            timer = nil
            
            // 归零
            currentValue = 0
            
            // 改变按钮\标签的文字
            customProgress?.presentLabel?.text = "完成"
            ButtonState.titleLabel?.text = "完成"
        }

    }
 
}

