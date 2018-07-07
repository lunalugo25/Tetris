//
//  GameViewController.swift
//  Tetris
//
//  Created by jorge luna on 7/2/18.
//  Copyright © 2018 Jorge Luna. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameCourtViewController: UIViewController, GameCourtViewProtocol {

    var presenter: GameCourtPresenterProtocol?

    @IBOutlet var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
    }
}
