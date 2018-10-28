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
        settingView.setCharInterval(Defaults[.oscCharInterval])
        
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
        
        settingView.charIntervalTextFieldEdit
            .subscribe(onNext: { interval in
                Defaults[.oscCharInterval] = interval
            }).disposed(by: disposeBag)
        
        settingView.sendButtonTap
            .subscribe(onNext: { [weak self] (text) in
                self?.sendCharMessage(text)
            }).disposed(by: disposeBag)
    }
    
    private func sendCharMessage(_ text: String) {
        if text.count < 1 {
            return
        }
        
        if let sendChar: KokkuriChar = KokkuriCharManager.char(String(text[text.startIndex])) {
            KokkuriFieldOSCManager.sendPosition(sendChar.relativeCenterPoint)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + Defaults[.oscCharInterval]) {
            let remainTexts = String(text.suffix(text.count - 1))
            self.settingView.setSendText(remainTexts)
            self.sendCharMessage(remainTexts)
        }
    }
}
