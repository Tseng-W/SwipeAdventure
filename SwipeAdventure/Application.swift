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

    func configure(_ window: UIWindow, options: UIScene.ConnectionOptions) {
        let applicationCoordinator = AppCoordinator(window: window)
        applicationCoordinator.start()
    }
}
