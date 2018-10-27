//
//  SettingView.swift
//  DigitalGenerationKOKKURI
//
//  Created by 村脇光洋 on 2018/10/27.
//  Copyright © 2018年 村脇光洋. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

final class SettingView: UIView {
    
    private let ipLabel: UILabel = UILabel()
    private let ipTextField: UITextField = UITextField()
    
    private let portLabel: UILabel = UILabel()
    private let portTextField: UITextField = UITextField()
    
    private let intervalLabel: UILabel = UILabel()
    private let intervalTextField: UITextField = UITextField()

    override init(frame: CGRect) {
        super.init(frame: frame)
    
        ipLabel.text = "IP Address"
        ipLabel.font = UIFont.boldSystemFont(ofSize: 18)

        portLabel.text = "port"
        portLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        intervalLabel.text = "interval"
        intervalTextField.font = UIFont.boldSystemFont(ofSize: 18)
        
        ipTextField.keyboardType = .numberPad
        portTextField.keyboardType = .numberPad
        intervalTextField.keyboardType = .numbersAndPunctuation

        backgroundColor = UIColor.white

        addSubview(ipLabel)
        addSubview(portLabel)
        addSubview(intervalLabel)
        addSubview(ipTextField)
        addSubview(portTextField)
        addSubview(intervalTextField)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    
        ipLabel.frame.origin = CGPoint(x: 40, y: 40)
        ipLabel.sizeToFit()
        
        ipTextField.frame.size = CGSize(width: 200, height: 20)
        ipTextField.frame.origin.x = ipLabel.frame.endPoint.x + 7
        ipTextField.center.y = ipLabel.center.y
        
        portLabel.sizeToFit()
        portLabel.frame.origin.x = ipTextField.frame.endPoint.x + 7
        portLabel.center.y = ipTextField.center.y
        
        portTextField.frame.size = CGSize(width: 200, height: 20)
        portTextField.frame.origin.x = portLabel.frame.endPoint.x + 7
        portTextField.center.y = portLabel.center.y
        
        intervalLabel.sizeToFit()
        intervalLabel.frame.origin.x = portTextField.frame.endPoint.x + 7
        intervalLabel.center.y = portTextField.center.y
        
        intervalTextField.frame.size = CGSize(width: 200, height: 20)
        intervalTextField.frame.origin.x = intervalLabel.frame.endPoint.x + 7
        intervalTextField.center.y = intervalLabel.center.y
    }
}
