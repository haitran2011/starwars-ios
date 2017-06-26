//
//  PeopleViewModel.swift
//  StarWars
//
//  Created by Matthew Delves on 25/6/17.
//  Copyright © 2017 reformedsoftware. All rights reserved.
//

import Foundation
import RxSwift

final class PeopleViewModel {
    let api: PeoplesAPI
    let characters: [String]
    let episodeNumber: Int

    var episodeImageName: String {
        return "episode\(episodeNumber)"
    }

    init(characters: [String], episodeNumber: Int) {
        api = PeoplesAPI(session: URLSession.shared)
        self.characters = characters
        self.episodeNumber = episodeNumber
    }

    func load() -> Observable<[Person]> {
        let observables = characters.map { url -> Observable<Person> in
            return api.load(from: url)
        }

        return Observable.from(observables)
              .merge()
              .toArray()
    }
}
