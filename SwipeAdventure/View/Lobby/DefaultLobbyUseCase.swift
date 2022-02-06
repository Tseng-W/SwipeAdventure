//
//  DefaultLobbyUseCase.swift
//  SwipeAdventure
//
//  Created by 曾問 on 2022/1/23.
//

import Foundation
import RxSwift

class DefaultLobbyUseCase {

}

extension DefaultLobbyUseCase: LobbyViewModel.UseCase {
    func getHabitList() -> Observable<LobbyViewModel.Snapshot> {
        var snapShot: LobbyViewModel.Snapshot = .init()
        snapShot.appendSections([.lobby])
        (0...10).forEach({ _ in
            snapShot.appendItems([.init(color: .red)])
        })
        return .just(snapShot)
    }
}
