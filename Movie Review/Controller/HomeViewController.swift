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
    
    var selectedGenre: String = ""
    var searchMovieText:String?
    var movieGenres = [GenreElement](){
        didSet{
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib.init(nibName: "PopularMovieCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PopularMovieCollectionViewCell")
        genreCollectionView.register(UINib.init(nibName: "GenreCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GenreCollectionViewCell")
        MovieRequest.fetchGenre(parameters: [:]) { (response) in
            self.movieGenres = response.genres ?? []
        }
        
        // Place the search bar in the navigation Item's title view.
        self.definesPresentationContext = true
        searchController.searchBar.placeholder = "Search Movie"
        searchController.searchBar.delegate = self
        
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).attributedPlaceholder = NSAttributedString(string: "Search Movie", attributes: [NSAttributedString.Key.foregroundColor:UIColor.black])
        searchController.searchBar.isTranslucent = false
        self.navigationItem.searchController = searchController
        // Don't hide the navigation bar because the search bar is in it.
        self.navigationItem.hidesSearchBarWhenScrolling = false
        
        print(movieGenres)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailMovieSegue" {
            let controller = segue.destination as! DetailMovieViewController
            //                controller.movie = selectedMovie
            
        }
        if segue.identifier == "MoviesSegue" {
            let controller = segue.destination as! MoviesViewController
            controller.searchText = searchMovieText
        }
        if segue.identifier == "DetailGenreSegue" {
            let controller = segue.destination as! DetailGenreViewController
            
        }
    }
    
}

extension HomeViewController:UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movieGenres.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PopularMovieCollectionViewCell", for: indexPath) as! PopularMovieCollectionViewCell
            
            // menghubungkan ke cell PopularMovieCollectionViewCell
            cell.setUpCell()
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenreCollectionViewCell", for: indexPath) as! GenreCollectionViewCell
//        cell.genreTitle.text = movieGenres[indexPath.row]
//        cell.genreImage.image = UIImage(named: movieGenres[indexPath.row])
        return cell
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

