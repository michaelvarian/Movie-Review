//
//  SegmentMovieCollectionViewCell.swift
//  Movie Review
//
//  Created by Michael Varian Sutanto on 16/04/20.
//  Copyright © 2020 Michael Varian Sutanto. All rights reserved.
//

import UIKit

protocol SegmentCollectionViewCellDelegate {
    func tapGenre()
}

class SegmentCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    var delegate:SegmentCollectionViewCellDelegate?
    var genre: [String] = []

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.register(UINib.init(nibName: "GenreCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GenreCollectionViewCell")
        
        // Initialization code
    }

}

extension SegmentCollectionViewCell:UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return genre.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GenreCollectionViewCell", for: indexPath) as! GenreCollectionViewCell
        cell.genreTitle.text = genre[indexPath.row]
        cell.genreImage.image = UIImage(named: genre[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = cellSize(widthInXr: 183, heightInXr: 105, cellSpacing: 16, leftInset: 0, rightInset: 0, numberOfCellInOneColumn: 2, collectionView: collectionView)
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.tapGenre()
    }

}
