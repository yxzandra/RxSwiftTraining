//
//  HotObservableController.swift
//  RxTraining
//
//  Created by Yxzandra Carolina Cordero Giron on 08-10-22.
//

import UIKit
import RxSwift

class HotObservableController: UIViewController {
    let disposeBag = DisposeBag()
    var hotObservable = PublishSubject<Int>()
    var runCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mockHotObservable()
    }
    
    func mockHotObservable() {
        _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.runCount += 1
            print(self.runCount)
            self.hotObservable.on(.next(self.runCount))
        }
    }
    
    @IBAction func subscribeToObservable(_ sender: Any) {
        hotObservable
            .subscribe(onNext: { element in
                print("Hot observable receive: ", element)
                
            })
            .disposed(by: disposeBag)
    }
}
