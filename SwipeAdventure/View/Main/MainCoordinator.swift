//
//  MainCoordinator.swift
//  SwipeAdventure
//
//  Created by 曾問 on 2021/12/15.
//

import UIKit

protocol MainCoordinatorProtocol: AnyObject {
    func showScreen(_ screen: MainScreen)
}

enum MainScreen {

}

class MainCoordinator: MainCoordinatorProtocol {
    private var viewController: MainViewController?

    func showScreen(_ screen: MainScreen) {
        guard let viewController = viewController else {
            return
        }
    }    
}
