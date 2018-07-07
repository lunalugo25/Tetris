//
//  DrawableCollectionCellProtocol.swift
//  Tetris
//
//  Created by Luna, Jorge on 7/7/18.
//  Copyright © 2018 Luna, Jorge. All rights reserved.
//

import UIKit

protocol DrawableCollectionCellProtocol {

    func cellForCollectionView(_ collectionView: UICollectionView, atIndexPath: IndexPath) -> UICollectionViewCell
    func drawCell(_ cell: UICollectionViewCell)
}
