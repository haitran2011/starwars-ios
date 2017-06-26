//
//  PeopleTableViewCell.swift
//  StarWars
//
//  Created by Matthew Delves on 25/6/17.
//  Copyright © 2017 reformedsoftware. All rights reserved.
//

import UIKit

class PeopleTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var race: UILabel!

    override func prepareForReuse() {
        name.text = ""
        gender.text = ""
        race.text = ""
    }

    func configure(with person: Person) {
        name.text = person.name.lowercased()
        gender.text = person.gender
        race.text = person.species
        accessoryType = .disclosureIndicator
    }
}
