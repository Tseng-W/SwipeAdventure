//
//  Application.swift
//  SwipeAdventure
//
//  Created by 曾問 on 2021/12/6.
//

import Foundation
import UIKit

final class Application {
    static let current: Application = .init()

    func start(_ window: UIWindow, options: UIScene.ConnectionOptions) {
        let coordinator = MainCoordinator()
        let useCase = DefaultMainUseCase()
        let vm = MainViewModel(coordinator: coordinator, useCase: useCase)
        let vc = MainViewController(vm)

        window.rootViewController = vc
        window.makeKeyAndVisible()
    }
}
