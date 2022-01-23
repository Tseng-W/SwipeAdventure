//
//  TabBarCoordinator.swift
//  SwipeAdventure
//
//  Created by 曾問 on 2022/1/23.
//

import UIKit

protocol TabBarFlow: AnyObject {
}

class TabBarCoordinator: Coordinator, TabBarFlow {
    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let useCase = DefaultTabBarUseCase()
        let viewModel = TabBarViewModel(useCase)
        viewModel.coordinator = self
        let tabBarController = TabBarViewController(viewModel)
        tabBarController.viewControllers = createTabControllers()

        window.rootViewController = tabBarController
    }
}

private extension TabBarCoordinator {
    func createTabControllers(cases: [MainTab] = MainTab.allCases) -> [UIViewController] {
        return cases.map({ tab -> UIViewController in
            let navigationController = UINavigationController()
            let coordinator = tab.createCoordinator(navigationController)
            coordinate(to: coordinator)
            return navigationController
        })
    }
}
