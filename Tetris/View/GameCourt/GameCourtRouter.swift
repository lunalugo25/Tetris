//
//  GameCourtWireFrame.swift
//  Tetris
//
//  Created by Luna, Jorge on 7/7/18.
//  Copyright © 2018 Luna, Jorge. All rights reserved.
//

import UIKit

final class GameCourtRouter: GameCourtRouterProtocol {

    static func createVIPER() -> GameCourtViewProtocol {

        let storyBoard = UIStoryboard(name: "GameCourt", bundle: nil)
        let view = storyBoard.instantiateViewController(withIdentifier: "GameCourtViewController") as! GameCourtViewProtocol


        let presenter: GameCourtPresenterProtocol = GameCourtPresenter()

        view.presenter = presenter
        presenter.view = view

        return view
    }
}
