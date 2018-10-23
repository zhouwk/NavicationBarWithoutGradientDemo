//
//  BController.swift
//  NavicationBarWithoutGradientDemo
//
//  Created by 周伟克 on 2018/10/18.
//  Copyright © 2018 周伟克. All rights reserved.
//

import UIKit

class BController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        view.backgroundColor = UIColor.green
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        leftView.backgroundColor = UIColor.orange
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftView)
        
        
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 30))
        titleView.backgroundColor = UIColor.orange
        navigationItem.titleView = titleView

    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        navigationController?.pushViewController(CController(), animated: true)
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
