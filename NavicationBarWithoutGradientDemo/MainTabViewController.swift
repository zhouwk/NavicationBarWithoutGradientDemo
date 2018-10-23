//
//  MainTabViewController.swift
//  NavicationBarWithoutGradientDemo
//
//  Created by 周伟克 on 2018/10/18.
//  Copyright © 2018 周伟克. All rights reserved.
//

import UIKit

class MainTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        addChildControllers()
    }
    
    
    private func addChildControllers() {
        
        let home = addChild(AController(), title: "首页")
        let msg = addChild(AController(), title: "消息")
        let publish = addChild(AController(), title: "发布")
        let hot = addChild(BController(), title: "热点")
        let about = addChild(AController(), title: "关于")

        viewControllers = [home, msg, publish, hot, about]
        
        
        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
        
        UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.red], for: .selected)
        
    }
    
    
    private func addChild(_ controller: UIViewController, title: String) -> NoGradientNavigationController {
        
        let navController = NoGradientNavigationController(rootViewController: controller)
        navController.tabBarItem.title = title
//        navController.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
//        navController.tabBarItem.setTitleTextAttributes([.foregroundColor: UIColor.red], for: .selected)
        return navController
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
