//
//  LobbyViewModel.swift
//  SwipeAdventure
//
//  Created by 曾問 on 2022/1/23.
//

import Foundation
import RxCocoa
import UIKit
import RxExtension

class LobbyViewModel: BaseViewModel {
    typealias UseCase = LobbyUseCase

    private let useCase: UseCase

    var coordinator: LobbyFlow?

    init(_ useCase: UseCase) {
        self.useCase = useCase
    }
}

extension LobbyViewModel {
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, ColorModel>
    typealias DataSource = UICollectionViewDiffableDataSource<Section, ColorModel>
    struct Input {
        var viewWillAppear: Driver<Void>
    }
    struct Output {
        var snapshot: Driver<Snapshot>
    }

    func transform(input: Input) -> Output {
        let _useCase = useCase
        let outputSnapshot = _useCase.getHabitList().asDriverOnErrorJustComplete()

        return .init(
            snapshot: outputSnapshot
        )
    }
}
