//
//  MovieTableViewCell.swift
//  Assessment3
//
//  Created by Leah Cluff on 6/28/19.
//  Copyright © 2019 Leah Cluff. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateViews()
    }
    var movie: Movie? {
        didSet {
            updateViews()
        }
    }
    func updateViews() {
        guard let movies = movie else {return}
        ratingLabel.text = movies.rating
        titleLabel.text = movies.title
        overviewLabel.text = movies.overview
     //   movieImageView.image = movies.imageURL
        }
    }


