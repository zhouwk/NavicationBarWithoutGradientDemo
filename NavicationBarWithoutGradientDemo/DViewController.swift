//
//  DViewController.swift
//  NavicationBarWithoutGradientDemo
//
//  Created by 周伟克 on 2018/10/18.
//  Copyright © 2018 周伟克. All rights reserved.
//

import UIKit

class DViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "D"
        view.backgroundColor = UIColor.darkGray
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for controller in navigationController!.viewControllers {
            if controller is AController {
                navigationController?.popToViewController(controller, animated: true)
                break
            }
        }
    }
}
