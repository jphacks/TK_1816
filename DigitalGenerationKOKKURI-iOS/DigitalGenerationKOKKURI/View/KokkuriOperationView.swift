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
import RxGesture

final class KokkuriOperationView: UIView {
    
    private let fieldImageView: UIImageView
    private let gridImageView: UIImageView
    private let toriiButton: UIButton
    private let debugLabel: UILabel
    
    private var disposeBag: DisposeBag
    
    private let filedPanSubject: PublishSubject<CGPoint> = PublishSubject<CGPoint>()
    public var fieldPan: Observable<CGPoint> {
        return filedPanSubject.asObserver()
    }
    
    public var toriiTap: Observable<Void> {
        return toriiButton.rx.tap.asObservable()
    }
    
    init() {
        let kokkuriFieldImage = UIImage(named: "field")
        let kokkuriGridImage = UIImage(named: "grid")
        
        self.fieldImageView = UIImageView(image: kokkuriFieldImage)
        self.gridImageView = UIImageView(image: kokkuriGridImage)
        self.toriiButton = UIButton()
        self.debugLabel = UILabel()
        self.disposeBag = DisposeBag()
        
        super.init(frame: CGRect.zero)
        
        debugLabel.text = "x: 150\n y: 111"
        debugLabel.numberOfLines = 0
        debugLabel.textAlignment = .left
        debugLabel.isHidden = true
        
        backgroundColor = UIColor.white
        
        // addSubview(gridImageView)
        addSubview(fieldImageView)
        addSubview(toriiButton)
        addSubview(debugLabel)
        
        bindRx()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        fieldImageView.frame.size = frame.size
        gridImageView.frame.size = frame.size
        
        toriiButton.frame.size = CGSize(width: 160, height: 150)
        toriiButton.frame.origin.y = 20
        toriiButton.center.x = frame.width / 2
        
        debugLabel.frame.origin = CGPoint(x: 50, y: 500)
        debugLabel.frame.size = CGSize(width: 200, height: 200)
    }
    
    private func bindRx() {
        toriiButton.rx.tap
            .debouncedBuffer(0.25, scheduler: MainScheduler.instance)
            .filter{ $0.count == 2}
            .subscribe(onNext: { [weak self] _ in
                self?.debugLabelSwitchHidden()
            })
            .disposed(by: disposeBag)
        
        fieldImageView.rx.panGesture()
            .subscribe(onNext: { [weak self] (recognizer) in
                guard let `self` = self else { return }
                
                let tapPoint = recognizer.location(in: self.fieldImageView)
                self.updateDebugLabel(tapPoint: tapPoint)
                self.filedPanSubject.onNext(tapPoint)
            }).disposed(by: disposeBag)
    }
    
    private func debugLabelSwitchHidden() {
        debugLabel.isHidden = !debugLabel.isHidden
    }
    
    private func updateDebugLabel(tapPoint: CGPoint) {
        debugLabel.text = "x: \(tapPoint.x)\n y: \(tapPoint.y)"
    }
}
