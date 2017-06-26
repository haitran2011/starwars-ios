//
//  FilmsViewModel.swift
//  StarWars
//
//  Created by Matthew Delves on 25/6/17.
//  Copyright © 2017 reformedsoftware. All rights reserved.
//

import Foundation
import RxSwift

final class FilmsViewModel {
    let api: FilmsAPI

    init() {
        api = FilmsAPI(session: URLSession.shared)
    }

    func load() -> Observable<[Film]> {
        return api.all()
    }
}
