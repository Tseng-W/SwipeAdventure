//
//  LobbyViewController.swift
//  SwipeAdventure
//
//  Created by 曾問 on 2022/1/23.
//

import UIKit
import ParameterHelper

class LobbyViewController: UIViewController {
    private let viewModel: LobbyViewModel

    init(_ viewModel: LobbyViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        self.viewModel = LobbyViewModel(DefaultLobbyUseCase.init())
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.tw.modifyBackgroundColor(.systemGray)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
}
