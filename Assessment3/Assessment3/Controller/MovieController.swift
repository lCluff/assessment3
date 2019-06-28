//
//  MovieController.swift
//  Assessment3
//
//  Created by Leah Cluff on 6/28/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

import UIKit


class MovieController {
    
    
    static let baseURL = "https://api.themoviedb.org/3/"
    
    static let baseImageURL =  " http://image.tmdb.org/t/p/w500/"
    
    static func fetchMovie(term: String, completion: @escaping([Movie]?) -> Void) {
    
        
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
