//
//  FilmsTableViewCell.swift
//  StarWars
//
//  Created by Matthew Delves on 25/6/17.
//  Copyright © 2017 reformedsoftware. All rights reserved.
//

import UIKit

final class FilmsTableViewCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var episode: UILabel!
    @IBOutlet weak var characters: UILabel!

    override func prepareForReuse() {
        title.text = ""
        episode.text = ""
        characters.text = ""
    }

    func configure(with film: Film) {
        title.text = film.title
        episode.text = "episode \(film.episodeId)"
        characters.text = "\(film.characters.count) characters"
    }
}
