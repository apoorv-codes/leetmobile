//
//  CoordinatorEventHandler.swift
//  LeetMobile
//
//  Created by Apoorv Verma on 10/3/24.
//

protocol CoordinatorEventHandler {
    associatedtype CoordinatorEvent
    
    func handle(_ event: CoordinatorEvent)
}
