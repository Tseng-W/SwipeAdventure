//
//  BaseType.swift
//  SwipeAdventure
//
//  Created by 曾問 on 2021/12/15.
//

import UIKit

protocol BaseViewModel {
    associatedtype Input
    associatedtype Output

    func transform(input: Input) -> Output
}

protocol Coordinator {
    func start()
    func coordinate(to coordinator: Coordinator)
}

extension Coordinator {
    func coordinate(to coordinator: Coordinator) {
        coordinator.start()
    }
}
