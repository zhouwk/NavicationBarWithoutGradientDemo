//
//  PreControllerSnapView.swift
//  NavicationBarWithoutGradientDemo
//
//  Created by 周伟克 on 2018/10/18.
//  Copyright © 2018 周伟克. All rights reserved.
//

import UIKit

class PreControllerSnapView: UIView {

    private weak var snapView: UIImageView!
    private weak var shadowView: UIView!
    
    var snapImage: UIImage? {
        didSet {
            snapView.image = snapImage
        }
    }
    
    var shadowColor: UIColor! {
        didSet {
            shadowView.backgroundColor = shadowColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    private func initUI() {
        
        let snapView = UIImageView(frame: .zero)
        snapView.contentMode = .scaleAspectFit
        addSubview(snapView)
        self.snapView = snapView
        
        
        let shadowView = UIView(frame: .zero)
        shadowView.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        addSubview(shadowView)
        self.shadowView = shadowView
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        snapView.frame = bounds
        shadowView.frame = bounds
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
