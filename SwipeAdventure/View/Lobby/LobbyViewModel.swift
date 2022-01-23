//
//  LobbyViewModel.swift
//  SwipeAdventure
//
//  Created by 曾問 on 2022/1/23.
//

import Foundation

class LobbyViewModel: BaseViewModel {
    typealias UseCase = LobbyUseCase

    private let useCase: UseCase

    var coordinator: LobbyFlow?

    init(_ useCase: UseCase) {
        self.useCase = useCase
    }
}

extension LobbyViewModel {
    struct Input {}
    struct Output {}
    func transform(input: Input) -> Output {
        return .init()
    }
}
