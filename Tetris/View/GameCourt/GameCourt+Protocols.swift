//
//  GameCourtProtocols.swift
//  Tetris
//
//  Created by jorge luna on 7/2/18.
//  Copyright © 2018 Jorge Luna. All rights reserved.
//

import UIKit

enum ViewSide {
    case left
    case right
}

protocol GameCourtRouterProtocol {
    static func createVIPER() -> GameCourtViewProtocol
}

// MARK: - View -> Presenter
protocol GameCourtPresenterProtocol: PresenterProtocol {

    weak var view: GameCourtViewProtocol? { get set }

    func didTapRotate()
    func didSwipeLeft()
    func didSwipeRight()
    func didSwipeDown()

    func didInitDrag(in position: CGFloat)
}

// MARK: - Presenter -> View
protocol GameCourtViewProtocol: ViewProtocol {

    var presenter: GameCourtPresenterProtocol? { get set }

    func setViewModel(_ newViewModel: [[DrawableCollectionCellProtocol]])
}
