//
//  BehaviorSubjectController.swift
//  RxTraining
//
//  Created by Yxzandra Carolina Cordero Giron on 08-10-22.
//

import Foundation
import UIKit
import RxSwift

class BehaviorSubjectController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let disposeBag = DisposeBag()
        let behaviorSubject = BehaviorSubject<String>(value: "default")
        
        behaviorSubject.on(.next("a"))
        behaviorSubject.on(.next("b"))
        
        let subscriptionOne = behaviorSubject
            .subscribe { event in
                print("Subscribe 1: ", event.element ?? event)
        }
        
        behaviorSubject.on(.next("c"))
        behaviorSubject.on(.next("d"))
        
        let subscriptionTwo = behaviorSubject
            .subscribe { event in
                print("Subscribe 2: ", event.element ?? event)
        }
        
        behaviorSubject.on(.next("e"))
        behaviorSubject.on(.next("f"))
        behaviorSubject.on(.next("g"))
        
        subscriptionOne.disposed(by: disposeBag)
        subscriptionTwo.disposed(by: disposeBag)
    }
}
