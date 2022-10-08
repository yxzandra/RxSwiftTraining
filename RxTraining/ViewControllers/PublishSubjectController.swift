//
//  PublishSubjectController.swift
//  RxTraining
//
//  Created by Yxzandra Carolina Cordero Giron on 08-10-22.
//

import Foundation
import UIKit
import RxSwift

class PublishSubjectController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let disposeBag = DisposeBag()
        let publishSubject = PublishSubject<String>()
        
        publishSubject.on(.next("a"))
        publishSubject.on(.next("b"))
        
        let subscriptionOne = publishSubject
            .subscribe { event in
                print("Subscribe 1: ", event.element ?? event)
        }
        
        publishSubject.on(.next("c"))
        publishSubject.on(.next("d"))
        
        let subscriptionTwo = publishSubject
            .subscribe { event in
                print("Subscribe 2: ", event.element ?? event)
        }
        
        publishSubject.on(.next("e"))
        publishSubject.on(.next("f"))
        publishSubject.on(.next("g"))
        
        subscriptionOne.disposed(by: disposeBag)
        subscriptionTwo.disposed(by: disposeBag)
    }
}
