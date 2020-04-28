//
//  Movies.swift
//  Movie Review
//
//  Created by Michael Varian Sutanto on 16/04/20.
//  Copyright © 2020 Michael Varian Sutanto. All rights reserved.
//

import Foundation

class MovieRequest{
    
    func fetchGenre() {
        struct Genre: Codable {
            var genres: [GenreElement]
        }
        
        // MARK: - GenreElement
        struct GenreElement: Codable {
            var id: Int
            var name: String
        
        private enum CodingKeys: String, CodingKey {
                case id
                case name
            }
        }
        
        guard let genreUrl = URL(string: "https://api.themoviedb.org/3/genre/movie/list?api_key=037f89158dc387e4d9dfe4b2a27e1de5&language=en-US") else { return }
        URLSession.shared.dataTask(with: genreUrl) { (data, response
            , error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let genreData = try decoder.decode(GenreElement.self, from: data)
                print(genreData.name ?? "Empty Name")
                
            } catch let err {
                print("Err", err)
            }
        }.resume()
    }
}
