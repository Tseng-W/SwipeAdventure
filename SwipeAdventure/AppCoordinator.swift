//
//  AppCoordinator.swift
//  SwipeAdventure
//
//  Created by 曾問 on 2022/1/23.
//

import UIKit

class AppCoordinator: Coordinator {
    let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let tabBarCoordinator = TabBarCoordinator(window: window)
        coordinate(to: tabBarCoordinator)
    }
}
