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
    
    lazy var disposeBag: DisposeBag = DisposeBag()
    
    public var ipTextFieldEdit: Observable<String> {
        return ipTextField.rx.text.filter({ (text) -> Bool in
                return text != nil
            })
            .map({ (text) -> String in
                return text!
            }).asObservable()
    }
    
    public var portTextFieldEdit: Observable<Int> {
        return portTextField.rx.text
            .map({ (text) -> Int? in
                return Int(text ?? "")
            })
            .filter({ num -> Bool in
                return num != nil
            })
            .map({ num -> Int in
                return num!
            })
    }
    
    public var intervalTextFieldEdit: Observable<Double> {
        return intervalTextField.rx.text
            .map({ (text) -> Double? in
                return Double(text ?? "")
            })
            .filter({ num -> Bool in
                return num != nil
            })
            .map({ num -> Double in
                return num!
            })
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    
        ipLabel.text = "IP Address"
        ipLabel.font = UIFont.boldSystemFont(ofSize: 18)

        portLabel.text = "port"
        portLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        intervalLabel.text = "interval"
        intervalLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        ipTextField.keyboardType = .numberPad
//        ipTextField.layer.borderColor = UIColor(red:0.42, green:0.42, blue:0.42, alpha:1.00).cgColor
//        ipTextField.layer.borderWidth = 1.2
//        ipTextField.layer.cornerRadius = 6
//        ipTextField.layer.masksToBounds = true
        ipTextField.delegate = self
        ipTextField.borderStyle = .roundedRect
        
        portTextField.keyboardType = .numberPad
//        portTextField.layer.borderColor = UIColor(red:0.42, green:0.42, blue:0.42, alpha:1.00).cgColor
//        portTextField.layer.borderWidth = 1.2
//        portTextField.layer.cornerRadius = 6
//        portTextField.layer.masksToBounds = true
        portTextField.delegate = self
        portTextField.borderStyle = .roundedRect
        
        intervalTextField.keyboardType = .numberPad
//        intervalTextField.layer.borderColor = UIColor(red:0.42, green:0.42, blue:0.42, alpha:1.00).cgColor
//        intervalTextField.layer.borderWidth = 1.2
//        intervalTextField.layer.cornerRadius = 6
//        intervalTextField.layer.masksToBounds = true
        intervalTextField.delegate = self
        intervalTextField.borderStyle = .roundedRect

        backgroundColor = UIColor.white

        addSubview(ipLabel)
        addSubview(portLabel)
        addSubview(intervalLabel)
        addSubview(ipTextField)
        addSubview(portTextField)
        addSubview(intervalTextField)
        
        bindRx()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    
        ipLabel.frame.origin = CGPoint(x: 40, y: 40)
        ipLabel.sizeToFit()
        
        ipTextField.frame.size = CGSize(width: 200, height: 24)
        ipTextField.frame.origin.x = ipLabel.frame.endPoint.x + 7
        ipTextField.center.y = ipLabel.center.y
        
        portLabel.sizeToFit()
        portLabel.frame.origin.x = ipTextField.frame.endPoint.x + 16
        portLabel.center.y = ipTextField.center.y
        
        portTextField.frame.size = CGSize(width: 200, height: 24)
        portTextField.frame.origin.x = portLabel.frame.endPoint.x + 7
        portTextField.center.y = portLabel.center.y
        
        intervalLabel.sizeToFit()
        intervalLabel.frame.origin.x = portTextField.frame.endPoint.x + 16
        intervalLabel.center.y = portTextField.center.y
        
        intervalTextField.frame.size = CGSize(width: 200, height: 24)
        intervalTextField.frame.origin.x = intervalLabel.frame.endPoint.x + 7
        intervalTextField.center.y = intervalLabel.center.y
    }
    
    private func bindRx() {
    
        rx.tapGesture()
            .skip(1)
            .subscribe(onNext: { [weak self] _ in
                self?.endEditing(true)
                
                UIView.animate(withDuration: 0.28, animations: {
                    if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                        appDelegate.window?.transform = CGAffineTransform.identity
                    }
                })
            }).disposed(by: disposeBag)

    }
    
    public func setIpTextField(text: String) {
        self.ipTextField.text = text
    }
    
    public func setPortTextField(num: Int) {
        self.portTextField.text = num.description
    }
    
    public func setInterval(_ interval: Double) {
        self.intervalTextField.text = interval.description
    }
}

extension SettingView: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.28) {
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                appDelegate.window?.transform = CGAffineTransform(translationX: 0, y: -300)
            }
        }
    }
}
