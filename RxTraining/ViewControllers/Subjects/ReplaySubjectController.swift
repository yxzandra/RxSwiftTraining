//
//  ReplaySubjectController.swift
//  RxTraining
//
//  Created by Yxzandra Carolina Cordero Giron on 08-10-22.
//

import Foundation
import UIKit
import RxSwift

class ReplaySubjectController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        let disposeBag = DisposeBag()
        let replaySubject = ReplaySubject<String>.create(bufferSize: 3)

        replaySubject.on(.next("a"))
        replaySubject.on(.next("b"))

        let subscriptionOne = replaySubject
            .subscribe { event in
                print("Subscribe 1: ", event.element ?? event)
        }

        replaySubject.on(.next("c"))
        replaySubject.on(.next("d"))
        
        let subscriptionTwo = replaySubject
            .subscribe { event in
                print("Subscribe 2: ", event.element ?? event)
        }

        replaySubject.on(.next("e"))
        replaySubject.on(.next("f"))
        replaySubject.on(.next("g"))

        subscriptionOne.disposed(by: disposeBag)
        subscriptionTwo.disposed(by: disposeBag)
    }
}
