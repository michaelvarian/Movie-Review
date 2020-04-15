//
//  MoviesExtention.swift
//  Movie Review
//
//  Created by Michael Varian Sutanto on 16/04/20.
//  Copyright © 2020 Michael Varian Sutanto. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func rounded() {
        self.layer.cornerRadius = self.layer.frame.size.width / 2
    }
}

extension UICollectionViewDelegateFlowLayout {
    func cellSize(widthInXr: CGFloat, heightInXr: CGFloat, cellSpacing: CGFloat, leftInset: CGFloat, rightInset: CGFloat, numberOfCellInOneColumn: CGFloat, collectionView: UICollectionView) -> CGSize {
        if numberOfCellInOneColumn == 0 {
            let height = collectionView.frame.size.height
            let width = CGFloat((widthInXr/heightInXr) * height)
            
            return CGSize(width: width, height: height)
        } else {
            let colletionViewWidth = collectionView.frame.size.width
            
            let totalCollectionViewWidth = colletionViewWidth - leftInset - rightInset
            var cellSpacing = cellSpacing.self
            var totalCellSpacing = CGFloat(0)
            
            if cellSpacing == 0 {
                cellSpacing = (totalCollectionViewWidth - (numberOfCellInOneColumn * widthInXr)) / (numberOfCellInOneColumn - 1)
                totalCellSpacing = cellSpacing * (numberOfCellInOneColumn - 1)
            } else {
                totalCellSpacing = cellSpacing
            }
            
            let width = CGFloat((totalCollectionViewWidth - totalCellSpacing) / numberOfCellInOneColumn)
            let height = CGFloat((heightInXr/widthInXr) * width)
            
            return CGSize(width: width, height: height)
        }
    }
}
