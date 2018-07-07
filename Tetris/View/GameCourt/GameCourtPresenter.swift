//
//  GameCourtPresenter.swift
//  Tetris
//
//  Created by jorge luna on 7/2/18.
//  Copyright © 2018 Jorge Luna. All rights reserved.
//

import Foundation

final class GameCourtPresenter: GameCourtPresenterProtocol {

    weak var view:  GameCourtViewProtocol?


    func viewDidLoad() {


        var column = [[DrawableCollectionCellProtocol]]()

        for _ in 0...Constants.GameCourt.height {

            var row = [DrawableCollectionCellProtocol]()
            for _ in 0...Constants.GameCourt.width {

                row.append(GameCourtViewCellModel(color: .blue))
            }

            column.append(row)
        }

        view?.setViewModel(column)
    }
}
