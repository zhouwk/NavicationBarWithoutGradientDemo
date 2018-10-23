//
//  UIViewExtension.swift
//  AVPlayerDemo
//
//  Created by 周伟克 on 2018/9/29.
//  Copyright © 2018年 周伟克. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    var x: CGFloat {
        
        get {
            return frame.origin.x
        }
        set {
            frame.origin.x = newValue
        }
        // extension只能添加计算属性，不能添加存储属性 didSet  willSet 这两个函数中存储的有设置前后的状态 不能使用
    }
    
    var y: CGFloat {
        
        get {
            return frame.origin.y
        }
        
        set {
            frame.origin.y = newValue
        }
    }
    
    
    var maxX: CGFloat {
        
        get {
            return frame.maxX
        }
        
        set {
            
            frame.origin.x = newValue - width
        }
    }
    
    
    var maxY: CGFloat {
        
        get {
            return frame.maxY
        }
        
        set {
            frame.origin.y = newValue - height
        }
    }
    
    var centerX: CGFloat {
        get {
            return center.x
        }
        
        set {
            frame.origin.x = newValue - width * 0.5
        }
    }
    
    var centerY: CGFloat {
        
        get {
            return center.y
        }
        
        set {
            frame.origin.y = newValue - height * 0.5
        }
    }
    
    var width: CGFloat {
        
        get {
            return frame.width
        }
        
        set {
            return frame.size.width = newValue
        }
    }
    
    var height: CGFloat {
        
        get {
            return frame.height
        }
        
        set {
            frame.size.height = newValue
        }
    }
    
    var size: CGSize {
        get {
            return frame.size
        }
        
        set {
            frame.size = newValue
        }
    }
    
    
    func snap() -> UIImage {
        
        // true 如果有透明像素，渲染出来的图片该区域是黑色
        // false 如果有透明像素，不糊有黑色
        // scale: uiscreen.main.scale, 设置0，苹果会自动适配
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
        
    }
}
