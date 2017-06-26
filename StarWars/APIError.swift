//
//  APIError.swift
//  StarWars
//
//  Created by Matthew Delves on 25/6/17.
//  Copyright © 2017 reformedsoftware. All rights reserved.
//

import Foundation

enum APIError: Error {
    case badURL
    case badJSON
    case other
}
