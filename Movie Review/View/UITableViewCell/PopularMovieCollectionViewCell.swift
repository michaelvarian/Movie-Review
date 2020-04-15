//
//  PopularMovieCollectionViewCell.swift
//  Movie Review
//
//  Created by Michael Varian Sutanto on 16/04/20.
//  Copyright © 2020 Michael Varian Sutanto. All rights reserved.
//

import UIKit

class PopularMovieCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieGenreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // Menghubungkan HomeViewController dengan PopularMovieCollectionViewCell
    func setUpCell () {
//        movieTitleLabel.text = movie.title
//        movieGenreLabel.text = movie.genre
        movieImageView.rounded()
        
    }

}
