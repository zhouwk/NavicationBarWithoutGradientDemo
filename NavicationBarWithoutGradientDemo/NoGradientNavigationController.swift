//
//  NoGradientNavigationController.swift
//  NavicationBarWithoutGradientDemo
//
//  Created by 周伟克 on 2018/10/18.
//  Copyright © 2018 周伟克. All rights reserved.
//

import UIKit

class NoGradientNavigationController: UINavigationController {
    
    
    lazy var preControllerViewSnaps = [UIImage]()
    
    lazy var snapView: PreControllerSnapView = {
        
        let snapView = PreControllerSnapView(frame: .zero)
        snapView.width = kScreenWidth
        snapView.height = kScreenHeight
        snapView.x = -kScreenWidth
        keyWindow.addSubview(snapView)
        
        return snapView
    }()
    
    
    
    weak var containerView: UIView! {
        return tabBarController?.view ?? view
    }
    
    weak var pan: UIPanGestureRecognizer!
    override func viewDidLoad() {
        super.viewDidLoad()
        addFullBackGes()
    }
    

    /// 添加全屏返回手势
    private func addFullBackGes() {
        
        interactivePopGestureRecognizer?.isEnabled = false
        let pan = UIPanGestureRecognizer(target: self,
                                         action: #selector(handle(_:)))
        pan.delegate = self
        view.addGestureRecognizer(pan)
        self.pan = pan
    }
    
    @objc func handle(_ pan: UIPanGestureRecognizer) {
        
        let translate = pan.translation(in: view)
        if translate.x <= 0 {
            return
        }
        switch pan.state {
        case .began:
//            snapView.image = preControllerViewSnaps.last
            break
        case .changed:
            
            snapView.snapImage = preControllerViewSnaps.last
            // 如果要做到top.view和导航条一起移动的效果，就必须移动整个导航条
            containerView.transform = CGAffineTransform(translationX: translate.x, y: 0)
            snapView.transform = CGAffineTransform(translationX: translate.x, y: 0)
            return
        default:
            if translate.x < view.width / 3 {
                // pop 无效
                UIView.animate(withDuration: 0.25) {
                    self.containerView.transform = .identity
                    self.snapView.transform = .identity
                }
            } else {
                // pop生效
                UIView.animate(withDuration: 0.25, animations: {
                    self.containerView.transform = CGAffineTransform(translationX: kScreenWidth, y: 0)
                    self.snapView.transform = CGAffineTransform(translationX: kScreenWidth, y: 0)
                    
                }) { (_) in
                    self.containerView.transform = .identity
                    self.snapView.transform = .identity
                    _ = self.popViewController(animated: false)
                }
            }
        }
    }
    
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count != 0 {
//            preControllerViewSnaps.append(view.snap())
            preControllerViewSnaps.append(keyWindow.snap())
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
    
    override func popViewController(animated: Bool) -> UIViewController? {
        preControllerViewSnaps.removeLast()
        return super.popViewController(animated: animated)
    }
    
    override func popToRootViewController(animated: Bool) -> [UIViewController]? {
        
        preControllerViewSnaps.removeAll()
        return super.popToRootViewController(animated: animated)
    }
    
    override func popToViewController(_ viewController: UIViewController, animated: Bool) -> [UIViewController]? {
        
        let poped = super.popToViewController(viewController, animated: animated)
        if let popCount = poped?.count {
            for _ in 0 ..< popCount {
                preControllerViewSnaps.removeLast()
            }
        }
        return poped
    }
}


extension NoGradientNavigationController: UIGestureRecognizerDelegate {
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        if gestureRecognizer ===  pan {
            return viewControllers.count > 1
        }
        // 预留处理其他手势
        return true
    }
}
