//
//  ColdObservableController.swift
//  RxTraining
//
//  Created by Yxzandra Carolina Cordero Giron on 06-10-22.
//

import UIKit
import RxSwift

class ColdObservableController: UIViewController {
    let disposeBag = DisposeBag()
    var coldObservable: Observable<String>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        coldObservable = mockColdObservable(element: "This is a cold Observable")
    }
    
    func mockColdObservable(element: String) ->Observable<String> {
        return Observable.create { observer in
            observer.on(.next(element))
            observer.on(.completed)
            return Disposables.create()
        }
    }
    
    @IBAction func subscribeToObservable(_ sender: Any) {
        coldObservable!
            .subscribe(onNext: { element in
                print(element)
            })
            .disposed(by: disposeBag)
    }
}
