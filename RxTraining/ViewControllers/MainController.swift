//
//  MainController.swift
//  RxTraining
//
//  Created by Yxzandra Carolina Cordero Giron on 08-10-22.
//

import Foundation
import UIKit

class MainViewController : UIViewController {
    @IBOutlet weak var pullDownButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let menuClosure = {(action: UIAction) in
            self.callNewViewController(action.discoverabilityTitle ?? "")
        }
        pullDownButton.menu = UIMenu(children: [
            UIAction(title: MenuObservables.keyFor(.basic), discoverabilityTitle: MenuObservables.keyForIdentifier(.basic), state: .on, handler:menuClosure),
            UIAction(title: MenuObservables.keyFor(.hot), discoverabilityTitle: MenuObservables.keyForIdentifier(.hot), handler: menuClosure),
            UIAction(title: MenuObservables.keyFor(.cold), discoverabilityTitle: MenuObservables.keyForIdentifier(.cold),handler: menuClosure),
            UIAction(title: MenuObservables.keyFor(.multicasting), discoverabilityTitle: MenuObservables.keyForIdentifier(.multicasting), handler: menuClosure),
            UIAction(title: MenuObservables.keyFor(.publishSubject), discoverabilityTitle: MenuObservables.keyForIdentifier(.publishSubject), handler: menuClosure),
            UIAction(title: MenuObservables.keyFor(.behaviorSubject), discoverabilityTitle: MenuObservables.keyForIdentifier(.behaviorSubject), handler: menuClosure),
            UIAction(title: MenuObservables.keyFor(.replaySubject), discoverabilityTitle: MenuObservables.keyForIdentifier(.replaySubject), handler: menuClosure),
            UIAction(title: MenuObservables.keyFor(.publishRelay), discoverabilityTitle: MenuObservables.keyForIdentifier(.publishRelay), handler: menuClosure),
            UIAction(title: MenuObservables.keyFor(.behaviorRelay), discoverabilityTitle: MenuObservables.keyForIdentifier(.behaviorRelay), handler: menuClosure)
        ])
        pullDownButton.showsMenuAsPrimaryAction = true
        pullDownButton.changesSelectionAsPrimaryAction = true
    }
    
    func callNewViewController(_ withIdentifier:String) {
        guard !withIdentifier.isEmpty else { return print("Seleccione una opción") }

        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: withIdentifier)
        self.present(nextViewController, animated:true, completion:nil)
    }
}
