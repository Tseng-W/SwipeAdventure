//
//  MainViewModel.swift
//  SwipeAdventure
//
//  Created by 曾問 on 2021/12/15.
//

import UIKit

class MainViewModel: BaseViewModel {

    private let coordinator: MainCoordinatorProtocol
    private let useCase: MainUseCaseProtocol

    init(coordinator: MainCoordinatorProtocol, useCase: MainUseCaseProtocol) {
        self.coordinator = coordinator
        self.useCase = useCase
    }

    struct Input {

    }

    struct Output {

    }

    func transform(input: Input) -> Output {
        return .init()
    }
}
