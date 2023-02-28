//
//  BehaviorRelayController.swift
//  RxTraining
//
//  Created by Yxzandra Carolina Cordero Giron on 15-11-22.
//

import UIKit
import RxSwift
import RxCocoa

class BehaviorRelayController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let disposeBag = DisposeBag()
        let behaviorRelay = BehaviorRelay<String>(value: "default")
        
        behaviorRelay.accept("a")
        behaviorRelay.accept("b")
        
        let subscriptionOne = behaviorRelay
            .subscribe { event in
                print("subscribe 1:", event.element ?? event)
        }
        
        behaviorRelay.accept("c")
        behaviorRelay.accept("d")

        let subscriptionTwo = behaviorRelay
            .subscribe { event in
                print("subscribe 2:", event.element ?? event)
                
        }
        
        behaviorRelay.accept("e")
        behaviorRelay.accept("f")
        behaviorRelay.accept("g")
        
        subscriptionOne.disposed(by: disposeBag)
        subscriptionTwo.disposed(by: disposeBag)
    }
}

