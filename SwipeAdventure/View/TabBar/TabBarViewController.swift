//
//  TabBarViewController.swift
//  SwipeAdventure
//
//  Created by 曾問 on 2022/1/22.
//

import UIKit
import DebugHelper
import ParameterHelper

class TabBarViewController: UITabBarController {
    let viewModel: TabBarViewModel

    init(_ viewModel: TabBarViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        SafeFatalError("Not implemented.")
        self.viewModel = .init(DefaultTabBarUseCase())
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

private extension TabBarViewController {
    func setupView() {
        tabBar.tw.modifyBackgroundColor(TWColor.white10)
    }
}
