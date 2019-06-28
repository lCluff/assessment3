//
//  MovieController.swift
//  Assessment3
//
//  Created by Leah Cluff on 6/28/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

import UIKit


class MovieController {
    
    
    static let baseImageURL =  " http://image.tmdb.org/t/p/w500/"
    
    static func fetchMovie(term: String, completion: @escaping([Movie]?) -> Void) {
        guard let baseURL = URL(string: "https://api.themoviedb.org/3/") else {return}
        let movieSearchComponent = baseURL.appendingPathComponent("search")
        var components = URLComponents(url: movieSearchComponent, resolvingAgainstBaseURL: true)
        let apiKeyQueryItem = URLQueryItem(name: "api_key", value: "fa70a22d94dd2b15d529ec58ae8010ee")
        components?.queryItems = [apiKeyQueryItem]
        
        guard let finalURL = components?.url else { completion(nil); return}
        
        print(finalURL)
        
        let dataTask = URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print("oh H*ck there's an error finding the movie. \(error.localizedDescription)")
                completion(nil)
                return
            }
        
            guard let data = data else { completion(nil); return}
            let decoder = JSONDecoder()
            
            do {
                let movies = try decoder.decode([Movie], from: data)
                print(movies)
                
            }
        }
    
    }
    
    static func fetchMovieImage(movie: Movie, completion: @escaping(UIImage?)-> Void) {
        let url = movie.imageURL
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print("error fetching image. \(error.localizedDescription)")
                completion(nil)
                return
            }
            guard let data = data else { completion(nil); return}
            let image = UIImage(data: data)
            completion(image)
            
            }.resume()
    }
}
