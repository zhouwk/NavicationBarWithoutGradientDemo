//
//  CController.swift
//  NavicationBarWithoutGradientDemo
//
//  Created by 周伟克 on 2018/10/18.
//  Copyright © 2018 周伟克. All rights reserved.
//

import UIKit

class CController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "C"
        view.backgroundColor = UIColor.blue
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        
//        let d = DViewController()
//        present(d, animated: true, completion: nil)
        
        
//        navigationController?.popToRootViewController(animated: true)
        
        
        navigationController?.pushViewController(DViewController(), animated: true)
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
