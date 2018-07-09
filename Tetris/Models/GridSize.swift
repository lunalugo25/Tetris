//
//  GridSize.swift
//  Tetris
//
//  Created by Luna, Jorge on 7/8/18.
//  Copyright © 2018 Luna, Jorge. All rights reserved.
//

import UIKit

struct GridSize {
    let columns: Int
    let rows: Int

    static var zero: GridSize {
        return GridSize(columns: 0, rows: 0)
    }
}
