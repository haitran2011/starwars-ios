//
//  PersonViewController.swift
//  StarWars
//
//  Created by Matthew Delves on 25/6/17.
//  Copyright © 2017 reformedsoftware. All rights reserved.
//

import UIKit

class PersonViewController: UIViewController {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var species: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var birthYear: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var mass: UILabel!
    @IBOutlet weak var skinColor: UILabel!
    @IBOutlet weak var eyeColor: UILabel!
    @IBOutlet weak var hairColor: UILabel!
    @IBOutlet weak var backgroundView: UIImageView!

    let person: Person
    let xibName: String = "PersonViewController"
    let backgroundImageName: String

    init(person: Person, backgroundImageName: String) {
        self.person = person
        self.backgroundImageName = backgroundImageName

        super.init(nibName: xibName, bundle: Bundle(for: PersonViewController.self))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        name.text = person.name
        species.text = person.species
        gender.text = person.gender
        birthYear.text = person.birthYear
        height.text = person.height
        mass.text = person.mass
        skinColor.text = person.skinColor
        eyeColor.text = person.eyeColor
        hairColor.text = person.hairColor

        let backgroundImage = UIImage(named: backgroundImageName)
        backgroundView.alpha = 0.25
        backgroundView.image = backgroundImage
        view.backgroundColor = .white
    }
}
