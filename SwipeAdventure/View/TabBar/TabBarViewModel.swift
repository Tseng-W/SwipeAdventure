//
//  TabBarViewModel.swift
//  SwipeAdventure
//
//  Created by 曾問 on 2022/1/22.
//

import Foundation

class TabBarViewModel: BaseViewModel {
    typealias UseCase = TabBarUseCase

    private let useCase: UseCase
    var coordinator: TabBarFlow?

    init(_ useCase: UseCase) {
        self.useCase = useCase
    }
}

extension TabBarViewModel {
    enum Views {
        case Main
    }
    struct Input {
    }
    struct Output {
    }
    func transform(input: Input) -> Output {
        return .init()
    }
}
