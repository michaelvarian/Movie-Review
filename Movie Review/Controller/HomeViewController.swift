//
//  HomeViewController.swift
//  Movie Review
//
//  Created by Michael Varian Sutanto on 15/04/20.
//  Copyright © 2020 Michael Varian Sutanto. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var genreCollectionView: UICollectionView!
    
    let movieCategorys: [String] = ["Action", "Adventure", "Animation", "Comedy", "Crime", "Documentary", "Drama", "Family" , "Fantasy", "History", "Horror", "Music", "Mystery", "Romance", "Science Fiction", "TV Movie", "Thriller", "War", "Western"]
    
//    var selectedMovie:Movie?
    var selectedGenre: String = ""
    var searchMovieText:String?
    
    // Keranjang Data Movie dari API
//    var movies = [Movie]() {
//        didSet{
//            DispatchQueue.main.async {
//                self.collectionView.reloadData()
//            }
//        }
//    }
    
//    var genre: Genre = .genre {
//        let indexPath = IndexPath(row: 0, section: 0)
//        genreCollectionView.scrollToItem(at: indexPath, at: .left, animated: true)
//    }
    
     let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib.init(nibName: "PopularMovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PopularMovieCollectionViewCell")
        genreCollectionView.register(UINib.init(nibName: "SegmentCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "SegmentCollectionViewCell")
        
        // Place the search bar in the navigation Item's title view.
        self.definesPresentationContext = true
        searchController.searchBar.placeholder = "Search Movie"
        searchController.searchBar.delegate = self
        searchController.definesPresentationContext = true
        //change searchbar color
        if let textfield = searchController.searchBar.value(forKey: "searchField") as? UITextField {
            if let backgroundview = textfield.subviews.first {
                backgroundview.backgroundColor = UIColor.init(white: 1, alpha: 1)
                backgroundview.layer.cornerRadius = 10
                backgroundview.clipsToBounds = true
            }
        }
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).attributedPlaceholder = NSAttributedString(string: "Search Movie", attributes: [NSAttributedString.Key.foregroundColor:UIColor.black])
        searchController.searchBar.isTranslucent = false
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "DetailMovieSegue" {
//            let controller = segue.destination as! DetailMovieViewController
//            controller.movie = selectedMovie
//        }
//        if segue.identifier == "MoviesSegue" {
//            let controller = segue.destination as! MoviesViewController
//            controller.searchText = searchMovieText
//        }
//        if segue.identifier == "DetailGenreSegue" {
//            let controller = segue.destination as! DetailGenreViewController
//        }
//    }
}

extension HomeViewController:UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if collectionView == self.collectionView {
//            return movies.count
//        }
    return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularMovieCollectionViewCell", for: indexPath) as! PopularMovieCollectionViewCell
            
            // mengambil data film dari keranjang movies (API)
//            let movie = movies[indexPath.row]
            
            // menghubungkan ke cell PopularMovieCollectionViewCell
            cell.setUpCell()
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SegmentCollectionViewCell", for: indexPath) as! SegmentCollectionViewCell
        cell.genre = movieCategorys
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewFlowLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionView {
            let size = cellSize(widthInXr: 117, heightInXr: 205, cellSpacing: 0, leftInset: 16, rightInset: 16, numberOfCellInOneColumn: 0, collectionView: collectionView)
            return size
        }
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
//        selectedMovie = self.movies[indexPath.row] as Movie
//        performSegue(withIdentifier: "DetailMovieSegue", sender: collectionView)
//    }
}

extension HomeViewController:SegmentCollectionViewCellDelegate{
    func tapGenre() {
        performSegue(withIdentifier: "DetailGenreSegue", sender: nil)
    }
}

extension HomeViewController:UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchController.dismiss(animated: true) {
            self.searchMovieText = searchBar.text
            self.performSegue(withIdentifier: "MoviesSegue", sender: nil)
        }
    }
}

