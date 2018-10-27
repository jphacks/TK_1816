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

class KokkuriOperationViewController: UIViewController {
    
    private var kokkuriOperationView: KokkuriOperationView {
        return self.view as! KokkuriOperationView
    }
    
    override func loadView() {
        self.view = KokkuriOperationView()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

