//
//  FilmsDataSource.swift
//  StarWars
//
//  Created by Matthew Delves on 25/6/17.
//  Copyright © 2017 reformedsoftware. All rights reserved.
//

import UIKit

final class FilmsDataSource: NSObject, UITableViewDataSource {
    var films: [Film] = []
    let cellIdentifier: String = "filmCell"

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return films.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? FilmsTableViewCell else { fatalError("Can't dequeue cell") }

        return cell
    }
}
