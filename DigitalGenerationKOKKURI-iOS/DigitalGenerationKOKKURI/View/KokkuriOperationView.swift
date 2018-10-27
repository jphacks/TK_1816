//
//  KokkuriOperationViewController.swift
//  DigitalGenerationKOKKURI
//
//  Created by 村脇光洋 on 2018/10/27.
//  Copyright © 2018年 村脇光洋. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

final class KokkuriOperationView: UIView {
    
    private let fieldImageView: UIImageView
    private let gridImageView: UIImageView
    private let toriiButton: UIButton
    
    init() {
        let kokkuriFieldImage = UIImage(named: "field")
        let kokkuriGridImage = UIImage(named: "grid")
        
        self.fieldImageView = UIImageView(image: kokkuriFieldImage)
        self.gridImageView = UIImageView(image: kokkuriGridImage)
        self.toriiButton = UIButton()
        
        super.init(frame: CGRect.zero)
        
        toriiButton.layer.borderColor = UIColor.red.cgColor
        toriiButton.layer.borderWidth = 1.2
        
        backgroundColor = UIColor.white
        
        // addSubview(gridImageView)
        addSubview(fieldImageView)
        addSubview(toriiButton)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        fieldImageView.frame.size = frame.size
        gridImageView.frame.size = frame.size
        
        toriiButton.frame.size = CGSize(width: 160, height: 150)
        toriiButton.frame.origin.y = 30
        toriiButton.center.x = frame.width / 2
    }
}
