//
//  File.swift
//  DigitalGenerationKOKKURI
//
//  Created by 村脇光洋 on 2018/10/27.
//  Copyright © 2018年 村脇光洋. All rights reserved.
//

import UIKit
import BottomPopup

final class SettingViewController: BottomPopupViewController {
    
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
        
        view.backgroundColor = UIColor.white
    }
}
