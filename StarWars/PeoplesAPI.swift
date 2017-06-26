//
//  PeoplesAPI.swift
//  StarWars
//
//  Created by Matthew Delves on 25/6/17.
//  Copyright © 2017 reformedsoftware. All rights reserved.
//

import Foundation
import RxSwift

final class PeoplesAPI {
    let session: URLSession
    let disposeBag: DisposeBag

    init(session: URLSession) {
        self.session = session
        self.disposeBag = DisposeBag()
    }

    func load(from url: String) -> Observable<Person> {
        return Observable.create { observer in
            guard let url = URL(string: url) else {
                observer.onError(APIError.badURL)
                return Disposables.create()
            }

            let request = URLRequest(url: url)

            let task = self.session.dataTask(with: request) { [weak self] data, response, error in
                guard let strongSelf = self else {
                    observer.onError(APIError.other)
                    return
                }
                if error != nil {
                    observer.onError(APIError.other)
                }

                if let data = data, let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments), let jsonData = json as? [String: Any] {
                    let species = jsonData["species"] as? [String] ?? []

                    self?.loadSpeciesName(from: species.first ?? "").subscribe(onNext: { name in
                        let person = Person(data: jsonData, speciesName: name)
                        observer.onNext(person)
                        observer.onCompleted()
                    })
                    .addDisposableTo(strongSelf.disposeBag)
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

    func loadSpeciesName(from url: String) -> Observable<String> {
        return Observable.create { observer in
            guard let url = URL(string: url) else {
                observer.onError(APIError.badURL)
                return Disposables.create()
            }

            let request = URLRequest(url: url)

            let task = self.session.dataTask(with: request) { data, response, error in
                if error != nil {
                    observer.onError(APIError.other)
                }

                if let data = data, let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any], let name = json?["name"] as? String {
                    observer.onNext(name)
                    observer.onCompleted()
                } else {
                    observer.onError(APIError.badJSON)
                }
            }

            task.resume()

            return Disposables.create {
                task.cancel()
            }
        }.catchErrorJustReturn("")
    }
}
