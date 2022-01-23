//
//  TabBarItemProvider.swift
//  SwipeAdventure
//
//  Created by 曾問 on 2022/1/22.
//

import UIKit
import ParameterHelper

protocol TabBarItem {
    var index: Int { get }
    func createCoordinator(_ navigationController: UINavigationController) -> Coordinator
}

enum MainTab: Int, CaseIterable, TabBarItem {
    case lobby = 0
    var index: Int {
        return self.rawValue
    }
    func createCoordinator(_ navigationController: UINavigationController) -> Coordinator {
        let coordinator = LobbyCoordinator(navigationController)
        return coordinator
    }
}
