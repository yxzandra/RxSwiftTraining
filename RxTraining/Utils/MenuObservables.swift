//
//  MenuObservables.swift
//  RxTraining
//
//  Created by Yxzandra Carolina Cordero Giron on 08-10-22.
//

import Foundation
import UIKit
enum MenuObservables: Int {
    case basic
    case hot
    case cold
    case multicasting

    case publishSubject
    case behaviorSubject
    case replaySubject

    case publishRelay
    case behaviorRelay
    
    static func keyFor(_ value: MenuObservables) -> String {
        switch value {
        case .basic: return "Basic Observable"
        case .hot: return "Hot Observable"
        case .cold: return "Cold Observable"
        case .multicasting: return "Multicasting"
        case .publishSubject: return "Publish Subject"
        case .behaviorSubject: return "Behavior Subject"
        case .replaySubject: return "Replay Subject"
        case .publishRelay: return "Publish Relay"
        case .behaviorRelay: return "Behavior Relay"
        }
    }
    
    static func keyForIdentifier(_ value: MenuObservables) -> String {
        switch value {
        case .basic: return "BasicObservableController"
        case .hot: return "HotObservableController"
        case .cold: return "ColdObservableController"
        case .multicasting: return "MulticastingController"
        case .publishSubject: return "PublishSubjectController"
        case .behaviorSubject: return "BehaviorSubjectController"
        case .replaySubject: return "ReplaySubjectController"
        case .publishRelay: return "PublishRelayController"
        case .behaviorRelay: return "BehaviorRelayController"
        }
    }
}
