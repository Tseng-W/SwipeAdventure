//
//  LobbyCoordinator.swift
//  SwipeAdventure
//
//  Created by 曾問 on 2022/1/23.
//

import UIKit

protocol LobbyFlow: AnyObject {
}

class LobbyCoordinator: Coordinator {
    let navigationController: UINavigationController

    init(_ navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let lobbyUseCase = DefaultLobbyUseCase()
        let lobbyViewModel = LobbyViewModel(lobbyUseCase)
        let lobbyViewController = LobbyViewController(lobbyViewModel)

        lobbyViewModel.coordinator = self

        navigationController.tabBarItem = .init(title: "Lobby", image: .add, tag: 0)
        navigationController.pushViewController(lobbyViewController, animated: false)
    }
}

extension LobbyCoordinator: LobbyFlow {

}
