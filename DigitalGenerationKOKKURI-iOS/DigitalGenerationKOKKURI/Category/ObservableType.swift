//
//  ObservableType.swift
//  DigitalGenerationKOKKURI
//
//  Created by 村脇光洋 on 2018/10/27.
//  Copyright © 2018年 村脇光洋. All rights reserved.
//

import RxSwift

extension ObservableType {
    func debouncedBuffer(_ dueTime: RxTimeInterval, scheduler: SchedulerType) -> Observable<[E]> {
        var buffer: [E] = []
        return self.do(onNext: { value in
            buffer.append(value)
        }).debounce(dueTime, scheduler: scheduler).flatMap { value -> Observable<[E]> in
            defer { buffer.removeAll() }
            return Observable<[E]>.just(buffer)
        }
    }
}
