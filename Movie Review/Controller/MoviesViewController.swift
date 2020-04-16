//
//  MoviesViewController.swift
//  Movie Review
//
//  Created by Michael Varian Sutanto on 15/04/20.
//  Copyright © 2020 Michael Varian Sutanto. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {
    
    var searchText:String?
    
    let searchController = UISearchController(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Place the search bar in the navigation item's title view.
        self.definesPresentationContext = true
        searchController.searchBar.placeholder = "Search Movie"
        searchController.searchBar.delegate = self
        searchController.definesPresentationContext = true
        searchController.searchBar.text = searchText
        //change searchbar color
        if let textfield = searchController.searchBar.value(forKey: "searchField") as? UITextField {
            if let backgroundview = textfield.subviews.first {
                backgroundview.backgroundColor = UIColor.init(white: 1, alpha: 1)
                backgroundview.layer.cornerRadius = 10
                backgroundview.clipsToBounds = true
            }
        }
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).attributedPlaceholder = NSAttributedString(string: "Search Movie", attributes: [NSAttributedString.Key.foregroundColor: UIColor.black])
        searchController.searchBar.isTranslucent = false
        
        self.navigationItem.searchController = searchController
        // Don't hide the navigation bar because the search bar is in it.
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension MoviesViewController:UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchText = searchBar.text
        searchController.dismiss(animated: true, completion: nil)
    }
}
