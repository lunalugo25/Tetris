//
//  GridSize.swift
//  Tetris
//
//  Created by Luna, Jorge on 7/8/18.
//  Copyright © 2018 Luna, Jorge. All rights reserved.
//

import UIKit

typealias GridCourt = [[DrawableCollectionCellProtocol]]

struct GridSize {
    let columns: Int
    let rows: Int

    static var zero: GridSize {
        return GridSize(columns: 0, rows: 0)
    }

    func getBaseGrid(with baseColor: UIColor) -> GridCourt {

        var baseGrid = GridCourt()

        for _ in 0..<rows {

            var rowCells = [DrawableCollectionCellProtocol]()
            for _ in 0..<columns {

                rowCells.append(GameCourtViewCellModel(color: baseColor))
            }

            baseGrid.append(rowCells)
        }
        return baseGrid
    }
}
