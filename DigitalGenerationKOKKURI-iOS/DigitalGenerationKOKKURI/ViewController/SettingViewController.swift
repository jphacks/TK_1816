//
//  File.swift
//  DigitalGenerationKOKKURI
//
//  Created by 村脇光洋 on 2018/10/27.
//  Copyright © 2018年 村脇光洋. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

import SwiftyUserDefaults
import BottomPopup

final class SettingViewController: BottomPopupViewController {
    
    lazy var disposeBag: DisposeBag = DisposeBag()
    
    private var settingView: SettingView {
        return self.view as! SettingView
    }
    
    override func loadView() {
        let width = UIScreen.main.bounds.width
        let height = getPopupHeight()
        self.view = SettingView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: width, height: height)))
    }
    
    override func getPopupPresentDuration() -> Double {
        return 0.3
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingView.setIpTextField(text: Defaults[.oscIp] ?? "localhost")
        settingView.setPortTextField(num: Defaults[.oscPort])
        settingView.setInterval(Defaults[.oscInterval])
        
        bindRx()
    }
    
    private func bindRx() {
        settingView.ipTextFieldEdit
            .subscribe(onNext: { ipStr in
                Defaults[.oscIp] = ipStr
                OSCManager.shared.setSendIp(ipStr)
            }).disposed(by: disposeBag)
        
        settingView.portTextFieldEdit
            .subscribe(onNext: { port in
                Defaults[.oscPort] = port
                OSCManager.shared.setSendPort(port)
            }).disposed(by: disposeBag)
        
        settingView.intervalTextFieldEdit
            .subscribe(onNext: { interval in
                Defaults[.oscInterval] = interval
                if let kokkuriOperateVC = self.presentingViewController as? KokkuriOperationViewController {
                    kokkuriOperateVC.bindFieldPan()
                }
            }).disposed(by: disposeBag)
    }
}
