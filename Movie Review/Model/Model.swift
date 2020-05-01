//
//  Model.swift
//  Movie Review
//
//  Created by Michael Varian Sutanto on 01/05/20.
//  Copyright © 2020 Michael Varian Sutanto. All rights reserved.
//

import UIKit

class GenresResponse: Codable {
    var genres:[GenreElement]
    enum CodingKeys: String, CodingKey {
        case genres = "data"
    }
}

// MARK: - GenreElement
class GenreElement: Codable {
    var id: Int?
    var name: String?
}
