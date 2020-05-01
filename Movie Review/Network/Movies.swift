//
//  Movies.swift
//  Movie Review
//
//  Created by Michael Varian Sutanto on 16/04/20.
//  Copyright © 2020 Michael Varian Sutanto. All rights reserved.
//

import UIKit

class MovieRequest: NSObject{
    
    class func fetchGenre(parameters: [String: String], completion: @escaping(GenresResponse) -> Void) {
        var components = URLComponents(string: "https://api.themoviedb.org/3/genre/movie/list?api_key=037f89158dc387e4d9dfe4b2a27e1de5&language=en-US")!
        components.queryItems = parameters.map {(id, name) in URLQueryItem(name: id, value: name)
        }
        
        if let genreUrl = components.url{
            URLSession.shared.dataTask(with: genreUrl) { (data, response, error) in
                if let data = data {
                    do {
                        let genreData = try JSONDecoder().decode(GenresResponse.self, from: data)
                        completion(genreData)
                    } catch let err {
                        print("Err", err)
                    }
                }
                }.resume()
            }
    }
}
