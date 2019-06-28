//
//  MovlieListTableViewController.swift
//  Assessment3
//
//  Created by Leah Cluff on 6/28/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

import UIKit

class MovlieListTableViewController: UITableViewController {
    
    @IBOutlet weak var movieSearchBar: UISearchBar!
    
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MovieController.fetchMovie(term: "Baby Driver", completion: { (movieItemFromCompletion) in
            if let unwrappedMovieItems = movieItemFromCompletion {
                self.movies = unwrappedMovieItems
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        })
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as?
            MovieTableViewCell else {return UITableViewCell() }
        
        let movieItem = movies[indexPath.row]
        cell.titleLabel.text = movieItem.title
        cell.overviewLabel.text = movieItem.overview
        cell.ratingLabel.text = movieItem.rating
        
        MovieController.fetchMovieImage(movie: movieItem) { (image) in
            DispatchQueue.main.async {
                cell.movieImageView.image = image
            }
        }
        return cell
    }
}

extension MovlieListTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text, searchTerm != "" else {return}
        MovieController.fetchMovie(term: searchTerm) { (movieItemFromCompletion) in
            if let unwrappedMovieItems = movieItemFromCompletion {
                self.movies = unwrappedMovieItems
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}
