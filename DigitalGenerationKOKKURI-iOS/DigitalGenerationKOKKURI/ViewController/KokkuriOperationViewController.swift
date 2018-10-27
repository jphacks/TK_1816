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

import SwiftOSC

class KokkuriOperationViewController: UIViewController {
    
    lazy var disposeBag: DisposeBag = DisposeBag()
    
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
        kokkuriOperationView.fieldPan
            .subscribe(onNext: { (point: CGPoint) in
                KokkuriFieldOSCManager.sendPosition(point)
            }).disposed(by: disposeBag)
        
        kokkuriOperationView.toriiTap
            .subscribe(onNext: { [weak self] _ in
                guard let `self` = self else { return }
                
                let vc = SettingViewController()
                self.present(vc, animated: true, completion: nil)
            }).disposed(by: disposeBag)
    }
}
