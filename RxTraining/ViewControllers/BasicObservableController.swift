//
//  BasicObservableController.swift
//  RxTraining
//
//  Created by Yxzandra Carolina Cordero Giron on 29-09-22.
//

import UIKit
import RxSwift

class BasicObservableController: UIViewController {
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        Observable.just("My event from Observable")
            .subscribe(onNext:{ element in
                print(element)
            }).disposed(by: disposeBag)

        Observable.of("A","B","C")
            .subscribe(onNext:{ element in
                print(element)
            })
            .disposed(by: disposeBag)
        
        Observable<String>.just("Just an item")
            .subscribe(onNext: { element in print(element)},
                       onError: {error in print("Error in the emision")},
                       onCompleted: {print("Completed the emision")})
            .disposed(by: disposeBag)
        
        myJust(element: "Just an item from my custom observable")
            .subscribe(onNext: {element in print(element)},
                       onError: {error in print("Error in the emision")},
                       onCompleted: {print("Completed the emision")})
            .disposed(by: disposeBag)
        
        myJustWithFlag(element: "Just an item from my custom observable")
            .subscribe(onNext: {element in print(element)},
                       onError: {error in print("Error in the emision")},
                       onCompleted: {print("Completed the emision")})
            .disposed(by: disposeBag)
    }
    
    func myJust<Int>(element: Int) -> Observable<Int> {
        return Observable.create{ observer in
            observer.on(.next(element))
            observer.on(.completed)
            return Disposables.create()
        }
    }
    
    func myJustWithFlag<Int>(element: Int) -> Observable<Int> {
        return Observable.create{ observer in
            let isSimulatedError = true
            
            if isSimulatedError {
                observer.on(.error(SampleError.initializesWereNil))
            }
            
            observer.on(.next(element))
            observer.on(.completed)
            return Disposables.create()
        }
    }
}

enum SampleError: Error {
    case error(Error), initializesWereNil
}
