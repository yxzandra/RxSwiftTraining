//
//  MulticastingController.swift
//  RxTraining
//
//  Created by Yxzandra Carolina Cordero Giron on 08-10-22.
//

import UIKit
import RxSwift

class MulticastingController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let scheduler = SerialDispatchQueueScheduler(qos: .default)

        let source = Observable<Int>.interval(.seconds(1), scheduler: scheduler)
            .take(20)
            .share(replay: 1, scope: .whileConnected)

        let subscriptionOne = source
            .subscribe { event in
                print("subscribe 1: ", event.element ?? event)
        }

        let subscriptionTwo = source
            .subscribe { event in
                print("subscribe 2: ", event.element ?? event)
        }

        Thread.sleep(forTimeInterval: 3.0)
        subscriptionOne.dispose()

        Thread.sleep(forTimeInterval: 3.0)
        subscriptionTwo.dispose()

        Thread.sleep(forTimeInterval: 3.0)
        let subscriptionThree = source
            .subscribe { event in
                print("subscribe 3: ", event.element ?? event)
        }

        Thread.sleep(forTimeInterval: 6.0)
        subscriptionThree.dispose()
    }
}
