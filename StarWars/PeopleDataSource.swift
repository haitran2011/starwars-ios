//
//  PeopleDataSource.swift
//  StarWars
//
//  Created by Matthew Delves on 25/6/17.
//  Copyright © 2017 reformedsoftware. All rights reserved.
//

import UIKit

final class PeopleDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    var people: [Person] = []
    let cellIdentifier = "personCell"

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? PeopleTableViewCell else { fatalError("Can't dequeue cell") }

        return cell
    }
}
