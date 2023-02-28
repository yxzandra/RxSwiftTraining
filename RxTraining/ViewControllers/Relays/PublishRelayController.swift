//
//  PublishRelayController.swift
//  RxTraining
//
//  Created by Yxzandra Carolina Cordero Giron on 15-11-22.
//

import UIKit
import RxSwift
import RxCocoa

class PublishRelayController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let disposeBag = DisposeBag()
        let publishRelay = PublishRelay<String>()
        
        publishRelay.accept("a")
        publishRelay.accept("b")
        
        let subscriptionOne = publishRelay
            .subscribe { event in
                print("subscribe 1:", event.element ?? event)
        }
        
        publishRelay.accept("c")
        publishRelay.accept("d")

        let subscriptionTwo = publishRelay
            .subscribe { event in
                print("subscribe 2:", event.element ?? event)
                
        }
        
        publishRelay.accept("e")
        publishRelay.accept("f")
        publishRelay.accept("g")
        
        subscriptionOne.disposed(by: disposeBag)
        subscriptionTwo.disposed(by: disposeBag)
    }
}
