//
//  AController.swift
//  NavicationBarWithoutGradientDemo
//
//  Created by 周伟克 on 2018/10/18.
//  Copyright © 2018 周伟克. All rights reserved.
//

import UIKit

class AController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = UIColor.red
        
        
        navigationItem.titleView = UISearchBar(frame: .zero)

    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        navigationController?.pushViewController(BController(), animated: true)
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
