//
//  MainViewController.swift
//  SwipeAdventure
//
//  Created by 曾問 on 2021/12/15.
//

import UIKit

class MainViewController: UIViewController {
    private let viewModel: MainViewModel

    init(_ viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = .green
    }

    required init?(coder: NSCoder) {
        self.viewModel = .init(coordinator: MainCoordinator.init(), useCase: DefaultMainUseCase.init())
        super.init(coder: coder)
    }
}
