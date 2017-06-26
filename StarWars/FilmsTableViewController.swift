//
//  FilmsTableViewController.swift
//  StarWars
//
//  Created by Matthew Delves on 25/6/17.
//  Copyright © 2017 reformedsoftware. All rights reserved.
//

import UIKit
import RxSwift

class FilmsTableViewController: UITableViewController {
    let xibName = "FilmsTableViewController"
    let viewModel: FilmsViewModel
    let disposeBag: DisposeBag
    let dataSource: FilmsDataSource

    init(viewModel: FilmsViewModel) {
        self.viewModel = viewModel
        disposeBag = DisposeBag()
        dataSource = FilmsDataSource()

        super.init(nibName: xibName, bundle: Bundle.main)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("Not Supported")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        configure()

        let loadingView = view.showLoading()
        viewModel.load()
        .observeOn(MainScheduler.instance)
        .subscribe(onNext: { [weak self] films in
            guard let strongSelf = self else { return }

            strongSelf.dataSource.films = films.sorted { $0.episodeId < $1.episodeId }
            strongSelf.tableView.reloadData()
        }, onCompleted: { [weak self] _ in
            self?.view.hideLoading(loadingView)
        })
        .addDisposableTo(disposeBag)
    }

    func configure() {
        tableView.dataSource = dataSource
        let cellNib = UINib(nibName: "FilmsTableViewCell", bundle: Bundle.init(for: FilmsViewModel.self))
        tableView.register(cellNib, forCellReuseIdentifier: dataSource.cellIdentifier)
        view.backgroundColor = .white
        let backgroundImage = UIImage(named: "Hoth")
        tableView.backgroundView = UIImageView(image: backgroundImage)
        tableView.backgroundView?.alpha = 0.25
        title = "films"
    }
}

extension FilmsTableViewController {
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let filmCell = cell as? FilmsTableViewCell else { return }

        filmCell.configure(with: dataSource.films[indexPath.row])
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let film = dataSource.films[indexPath.row]
        let peopleVM = PeopleViewModel(characters: film.characters, episodeNumber: film.episodeId)
        let peopleVC = PeopleTableViewController(viewModel: peopleVM)
        let backItem = UIBarButtonItem()

        backItem.title = ""
        navigationItem.backBarButtonItem = backItem
        navigationController?.pushViewController(peopleVC, animated: true)
    }
}
