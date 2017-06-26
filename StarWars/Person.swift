//
//  Person.swift
//  StarWars
//
//  Created by Matthew Delves on 25/6/17.
//  Copyright © 2017 reformedsoftware. All rights reserved.
//

import Foundation

struct Person {
    let name: String
    let height: String
    let mass: String
    let hairColor: String
    let skinColor: String
    let eyeColor: String
    let birthYear: String
    let gender: String
    let homeworld: String
    let films: [String]
    let species: String
    let vehicles: [String]
    let starships: [String]

    init(data: [String: Any], speciesName: String) {
        name = data["name"] as? String ?? ""
        height = data["height"] as? String ?? ""
        mass = data["mass"] as? String ?? ""
        hairColor = data["hair_color"] as? String ?? ""
        skinColor = data["skin_color"] as? String ?? ""
        eyeColor = data["eye_color"] as? String ?? ""
        birthYear = data["birth_year"] as? String ?? ""
        gender = data["gender"] as? String ?? ""
        homeworld = data["homeworld"] as? String ?? ""
        films = data["films"] as? [String] ?? []
        species = speciesName
        vehicles = data["vehicles"] as? [String] ?? []
        starships = data["starships"] as? [String] ?? []
    }
}
