//
//  GameCourtPresenter.swift
//  Tetris
//
//  Created by jorge luna on 7/2/18.
//  Copyright © 2018 Jorge Luna. All rights reserved.
//

import UIKit

private typealias GameCourt = Constants.GameCourt

final class GameCourtPresenter: GameCourtPresenterProtocol {

    weak var view:  GameCourtViewProtocol?

    private var gridCourt = GridSize.zero

    func viewDidAppear() {

        var rows  = [[DrawableCollectionCellProtocol]]()

        gridCourt = GridSize(columns: GameCourt.height, rows: GameCourt.width)

        for row in 0..<GameCourt.height {

            var columns = [DrawableCollectionCellProtocol]()
            let rowColor: UIColor = row%2 == 0 ? .blue: .red

            for column in 0..<GameCourt.width {


                let columnColor: UIColor = column%2 == 0 ? rowColor.darker: rowColor.lighter
//                columns.append(GameCourtViewCellModel(color: columnColor))
                columns.append(GameCourtViewCellModel(color: .darkGray))
            }

            rows.append(columns)
        }

        view?.setViewModel(rows)
    }
}
