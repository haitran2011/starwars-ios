//
//  FilmFetcher.swift
//  StarWars
//
//  Created by Matthew Delves on 25/6/17.
//  Copyright © 2017 reformedsoftware. All rights reserved.
//

import Foundation
import RxSwift

final class FilmsAPI {
    let session: URLSession

    init(session: URLSession) {
        self.session = session
    }

    func all() -> Observable<[Film]> {
        return Observable.create { observer in
            guard let url = URL(string: "https://swapi.co/api/films") else {
                observer.onError(APIError.badURL)
                return Disposables.create()
            }

            let request = URLRequest(url: url)

            let task = self.session.dataTask(with: request) { data, response, error in
                if error != nil {
                    observer.onError(APIError.other)
                }

                if let data = data, let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any], let results = json?["results"] as? [[String: Any]] {
                    let films = results.map { Film(data: $0) }
                    observer.onNext(films)
                    observer.onCompleted()
                } else {
                    observer.onError(APIError.badJSON)
                }
            }

            task.resume()

            return Disposables.create {
                task.cancel()
            }
        }
    }
}
