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
    
    init() {
        self.fieldImageView = UIImageView()
        self.gridImageView = UIImageView()
        
        super.init(frame: CGRect.zero)
        
        gridImageView.backgroundColor = UIColor.green
        
        addSubview(fieldImageView)
        addSubview(gridImageView)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        fieldImageView.frame.size = frame.size
        gridImageView.frame.size = frame.size
    }
}
