//
//  LobbyViewController.swift
//  SwipeAdventure
//
//  Created by 曾問 on 2022/1/23.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa
import FSCalendar
import ParameterHelper
import RxExtension
import DebugHelper

class LobbyViewController: UIViewController {
    private let viewModel: LobbyViewModel

    private var calendar: FSCalendar! = .init()
    private var collectionView: UICollectionView!
    private var dataSource: LobbyViewModel.DataSource!

    private let disposeBag: DisposeBag = .init()

    init(_ viewModel: LobbyViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        self.viewModel = LobbyViewModel(DefaultLobbyUseCase.init())
        super.init(coder: coder)
    }

    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupDataSource()
        bindView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setBarColor(TWColor.white10)
    }
}

private extension LobbyViewController {
    func setupDataSource() {
        dataSource = .init(collectionView: collectionView, cellProvider: { collectionView, indexPath, itemIdentifier in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: TempLobbyCell.self), for: indexPath) as? TempLobbyCell else {
                return .init()
            }
            cell.contentView.backgroundColor = itemIdentifier.color
            return cell
        })
    }
    func setupUI() {
        view.backgroundColor = TWColor.white20

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: getCollectionViewLayout())
        collectionView.register(TempLobbyCell.self, forCellWithReuseIdentifier: TempLobbyCell.identifier)


        view.addSubview(calendar)
        view.addSubview(collectionView)

        calendar.snp.makeConstraints({
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalToSuperview().multipliedBy(0.4)
        })
        collectionView.snp.makeConstraints({
            $0.top.equalTo(calendar.snp.bottom)
            $0.bottom.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        })
        
        self.collectionView = collectionView
    }
    func bindView() {
        let output = viewModel.transform(input: .init(
            viewWillAppear: rx.viewWillAppear.asDriver()
        ))

        output.snapshot
            .drive(snapShotBinder)
            .disposed(by: disposeBag)
    }
    func getCollectionViewLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout.init { sectionIndex, layoutEnvironment in
            let itemSize = NSCollectionLayoutSize(
              widthDimension: .fractionalWidth(1.0),
              heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)

            let groupHeight = NSCollectionLayoutDimension.fractionalWidth(0.3)
            let groupSize = NSCollectionLayoutSize(
              widthDimension: .fractionalWidth(1.0),
              heightDimension: groupHeight)
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)

            return NSCollectionLayoutSection(group: group)
        }
    }
}

// MARK: Binder
private extension LobbyViewController {
    var snapShotBinder: Binder<LobbyViewModel.Snapshot> {
        return Binder.init(self) { vc, snapshot in
            guard let dataSource = vc.dataSource else { return }
            dataSource.apply(snapshot)
        }
    }
}

enum Section: String, Hashable {
    case lobby
}

struct ColorModel: Hashable {
    var uuid = UUID()
    var color: UIColor

    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
}

class TempLobbyCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.tw.modifyBackgroundColor(.green)

        let view = UIView.init()
        view.tw.modifyBackgroundColor(.red)
        addSubview(view)
        view.snp.makeConstraints({
            $0.edges.equalToSuperview()
        })
    }
    required init?(coder: NSCoder) {
        SafeFatalError("not impmapsdasd")
        super.init(coder: coder)
    }
}
