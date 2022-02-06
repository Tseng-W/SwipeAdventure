//
//  LobbyHabitCell.swift
//  SwipeAdventure
//
//  Created by 曾問 on 2022/1/28.
//

import UIKit
import DebugHelper

final class LobbyHabitCell: UITableViewCell {
    static let identifier: String = "lobby-habit-cell-identifier"
    let nameLabel: UILabel

    init(name: String) {
        self.nameLabel = .init()
        self.nameLabel.text = name
        super.init(frame: .init())
    }

    required init?(coder: NSCoder) {
        self.nameLabel = .init()
        SafeFatalError("init(coder:) has not been implemented")
        super.init(coder: coder)
    }
}
