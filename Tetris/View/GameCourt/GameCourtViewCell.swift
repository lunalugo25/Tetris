//
//  GameCourtViewCell.swift
//  Tetris
//
//  Created by Luna, Jorge on 7/7/18.
//  Copyright © 2018 Luna, Jorge. All rights reserved.
//

import UIKit

struct GameCourtViewCellModel: DrawableCollectionCellProtocol {

    let color: UIColor

    func cellForCollectionView(_ collectionView: UICollectionView, atIndexPath: IndexPath) -> UICollectionViewCell {

        return collectionView.dequeueReusableCell(withReuseIdentifier: "GameCourtViewCell", for: atIndexPath)
    }

    func drawCell(_ cell: UICollectionViewCell) {
        if let cell = cell as? GameCourtViewCell {
            cell.configure(color: color)
        }
    }
}

class GameCourtViewCell: UICollectionViewCell {

    @IBOutlet weak var cellColor: UIView!

    override func prepareForReuse() {
        cellColor.backgroundColor = .clear
    }

    func configure(color: UIColor) {

        cellColor.backgroundColor = color
    }
}
