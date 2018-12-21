//: Playground - noun: a place where people can play

import UIKit
import RxSwift
import PlaygroundSupport

let disposeBag = DisposeBag()

print("Throttle false")
/*
 ------(1)-(2)-(3)----
 throttle(time, false)
 ------(1)------------
 */

do {
    let th = PublishSubject<Int>()
    
    th
        .asObservable()
        .throttle(1, latest: false, scheduler: MainScheduler.instance)
        .subscribe(onNext: { value in
            print(value)
        })
        .disposed(by: disposeBag)
    
    th.onNext(1)
    th.onNext(2)
    th.onNext(3)
    th.onNext(4)
    th.onNext(5)
}

print("Throttle true")

/*
 ------(1)-(2)-(3)----
 throttle(time, true)
 ------(1)-----(3)----
 */

do {
    let th = PublishSubject<Int>()
    
    th
        .asObservable()
        .throttle(1, latest: true, scheduler: MainScheduler.instance)
        .subscribe(onNext: { value in
            print(value)
        })
        .disposed(by: disposeBag)
    
    th.onNext(1)
    th.onNext(2)
    th.onNext(3)
    th.onNext(4)
    th.onNext(5)
}

PlaygroundPage.current.needsIndefiniteExecution = true
