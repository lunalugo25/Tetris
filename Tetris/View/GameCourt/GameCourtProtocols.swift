//
//  GameCourtProtocols.swift
//  Tetris
//
//  Created by jorge luna on 7/2/18.
//  Copyright © 2018 Jorge Luna. All rights reserved.
//

import Foundation

protocol GameCourtWireframeProtocol {
    static func createModule() -> GameCourtViewProtocol
}

// MARK: - View -> Presenter
protocol GameCourtPresenterProtocol: PresenterProtocol {

    weak var view: GameCourtViewProtocol? { get set }
}

// MARK: - PRESENTER -> VIEW
protocol GameCourtViewProtocol: ViewProtocol {

    var presenter: GameCourtPresenterProtocol? { get set }
}
