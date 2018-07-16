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
    private var piece = Piece(type: .zeta)

    func viewDidAppear() {

        gridCourt = GridSize(columns: GameCourt.width, rows: GameCourt.height)

        piece.currentPosition = IndexPath(row: 0, section: 1)
        drawGrid()

//        for time in 0...10 {
//
//            DispatchQueue.main.asyncAfter(deadline: .after(TimeInterval(time)), execute: {
//                self.drawGrid()
////                self.piece.position.section += 1
//                self.piece.rotate()
////                if time%2 == 0 {
////                    self.piece.rotate()
////                }
//            })
//        }

    }

    func didTapRotate() {
        piece.rotate()
        drawGrid()
    }

    func didSwipeLeft() {

        attemptMoving(to: IndexPath(row: -1, section: 0))
        drawGrid()
    }

    func didSwipeRight() {

        attemptMoving(to: IndexPath(row: 1, section: 0))
        drawGrid()
    }

    func didSwipeDown() {

        attemptMoving(to: IndexPath(row: 0, section: 1))
        drawGrid()
    }

    func didInitDrag(in position: CGFloat) {

        let side: ViewSide = position > 0.5 ? .right : .left
        let centerPiece = piece.type.width(for: piece.direction)

        print("Side: \(side), center: \(centerPiece), position: \(position)")
    }

    private func drawGrid() {

        var baseGrid = gridCourt.getBaseGrid(with: .red)

        baseGrid = drawPiece(in: baseGrid)

        view?.setViewModel(baseGrid)
    }

    private func drawPiece(in gridCourt: GridCourt) -> GridCourt {
        var gridReturned = gridCourt
        piece.getBlocks(for: piece.currentPosition).forEach { (block) in
            gridReturned[block.section][block.row] = GameCourtViewCellModel(color: .blue)
        }
        return gridReturned
    }

    private func attemptMoving(to index:IndexPath) {

        let newPosition = IndexPath(row:     index.row     + piece.currentPosition.row,
                                    section: index.section + piece.currentPosition.section)

        let newPieceBlocks = piece.getBlocks(for: newPosition)

        guard gridCourt.contains(newPieceBlocks) else {
            return
        }
        piece.currentPosition = newPosition
    }
}
