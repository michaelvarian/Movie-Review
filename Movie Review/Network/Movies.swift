//
//  Movies.swift
//  Movie Review
//
//  Created by Michael Varian Sutanto on 16/04/20.
//  Copyright © 2020 Michael Varian Sutanto. All rights reserved.
//

import Foundation

class MovieRequest: NSObject{
    class func fetchMovieGenres() {
        let api_Key = "037f89158dc387e4d9dfe4b2a27e1de5"
        let url = NSURL(string: "https://api.themoviedb.org/3/genre/movie/list?api_key=\(api_Key)&language=en-US")
        let request = NSURLRequest(url: url! as URL, cachePolicy: NSURLRequest.CachePolicy.reloadIgnoringLocalCacheData, timeoutInterval: 10)
       
        let session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: .main)
        
        let task: URLSessionDataTask = session.dataTask(with: request as URLRequest, completionHandler: { (dataOrNil, response, error) in
            if let data = dataOrNil {
                if let responseDictionary = try! JSONSerialization.jsonObject(with: data, options:[]) as? NSDictionary {
                     responseDictionary["genres"]
                }
            }
        })
        task.resume()
    }
}
