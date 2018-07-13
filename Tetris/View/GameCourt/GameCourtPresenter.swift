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
    private var piece = Piece(type: .jay)

    func viewDidAppear() {

        gridCourt = GridSize(columns: GameCourt.width, rows: GameCourt.height)

        drawGrid()


        for time in 0...10 {

            DispatchQueue.main.asyncAfter(deadline: .after(TimeInterval(time)), execute: {
                self.drawGrid()
//                self.piece.position.section += 1
                self.piece.rotate()
//                if time%2 == 0 {
//                    self.piece.rotate()
//                }
            })
        }

    }

    private func drawGrid() {

        var baseGrid = gridCourt.getBaseGrid(with: .red)

        baseGrid = drawPiece(in: baseGrid)

        view?.setViewModel(baseGrid)
    }

    private func drawPiece(in gridCourt: GridCourt) -> GridCourt{
        var gridReturned = gridCourt
        piece.getBlocks(for: piece.position).forEach { (block) in
            gridReturned[block.section][block.row] = GameCourtViewCellModel(color: .blue)
        }
        return gridReturned
    }
}
