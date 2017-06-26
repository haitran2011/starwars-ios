//
//  PeopleTableViewController.swift
//  StarWars
//
//  Created by Matthew Delves on 25/6/17.
//  Copyright © 2017 reformedsoftware. All rights reserved.
//

import UIKit
import RxSwift

class PeopleTableViewController: UITableViewController {
    let viewModel: PeopleViewModel
    let xibName: String = "PeopleTableViewController"
    let disposeBag: DisposeBag
    let dataSource: PeopleDataSource

    init(viewModel: PeopleViewModel) {
        self.viewModel = viewModel
        self.disposeBag = DisposeBag()
        self.dataSource = PeopleDataSource()

        super.init(nibName: xibName, bundle: Bundle(for: PeopleTableViewController.self))
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("Not supported")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        configure()

        let loadingView = view.showLoading()
        viewModel.load()
        .observeOn(MainScheduler.instance)
        .subscribe(onNext: { [weak self] people in
            self?.dataSource.people = people.sorted { $0.name < $1.name }
            self?.tableView.reloadData()
        }, onCompleted: { [weak self] _ in
            self?.view.hideLoading(loadingView)
        })
        .addDisposableTo(disposeBag)
    }

    func configure() {
        tableView.dataSource = dataSource
        let cellNib = UINib(nibName: "PeopleTableViewCell", bundle: Bundle(for: PeopleViewModel.self))
        tableView.register(cellNib, forCellReuseIdentifier: dataSource.cellIdentifier)

        let backgroundImage = UIImage(named: viewModel.episodeImageName)
        let backgroundView = UIImageView(image: backgroundImage)
        backgroundView.alpha = 0.25
        tableView.backgroundView = backgroundView
        tableView.backgroundColor = .white
        title = "characters"
    }
}

extension PeopleTableViewController {
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let peopleCell = cell as? PeopleTableViewCell else { return }

        let person = dataSource.people[indexPath.row]

        peopleCell.configure(with: person)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let person = dataSource.people[indexPath.row]
        let personVC = PersonViewController(
            person: person,
            backgroundImageName: viewModel.episodeImageName
        )
        let backItem = UIBarButtonItem()

        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
        navigationController?.pushViewController(personVC, animated: true)
    }
}
