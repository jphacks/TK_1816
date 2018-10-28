//
//  ViewController.swift
//  DigitalGenerationKOKKURI
//
//  Created by 村脇光洋 on 2018/10/27.
//  Copyright © 2018年 村脇光洋. All rights reserved.
//

import UIKit

import RxSwift
import RxCocoa

import SwiftyUserDefaults

class KokkuriOperationViewController: UIViewController {
    
    lazy var disposeBag: DisposeBag = DisposeBag()
    lazy var fieldPanDisposeBag: DisposeBag = DisposeBag()
    
    private var kokkuriOperationView: KokkuriOperationView {
        return self.view as! KokkuriOperationView
    }
    
    override func loadView() {
        self.view = KokkuriOperationView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindRx()
    }
    
    private func bindRx() {
        bindFieldPan()
        
        kokkuriOperationView.toriiTap
            .subscribe(onNext: { [weak self] _ in
                guard let `self` = self else { return }
                
                let vc = SettingViewController()
                self.present(vc, animated: true, completion: nil)
            }).disposed(by: disposeBag)
    }
    
    public func bindFieldPan() {
        fieldPanDisposeBag = DisposeBag()
        
        kokkuriOperationView.fieldPan
            .throttle(Defaults[.oscInterval], scheduler: MainScheduler.instance)
            .subscribe(onNext: { (point: CGPoint) in
                KokkuriFieldOSCManager.shared.sendPosition(point)
            }).disposed(by: disposeBag)
    }
}
