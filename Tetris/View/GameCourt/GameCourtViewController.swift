//
//  GameViewController.swift
//  Tetris
//
//  Created by jorge luna on 7/2/18.
//  Copyright © 2018 Jorge Luna. All rights reserved.
//

import UIKit

class GameCourtViewController: UIViewController, GameCourtViewProtocol {

    var presenter: GameCourtPresenterProtocol?

    @IBOutlet var collectionView: UICollectionView!

    private var viewModel = [[DrawableCollectionCellProtocol]]() {
        didSet {
            collectionView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
    }

    func setViewModel(_ viewModel: [[DrawableCollectionCellProtocol]]) {
        
        self.viewModel = viewModel
    }
}

extension GameCourtViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return viewModel.count
    }

    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return viewModel[section].count
    }

    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let model = viewModel[indexPath.section][indexPath.row]
        let cell = model.cellForCollectionView(collectionView, atIndexPath: indexPath)

        model.drawCell(cell)

        return cell
    }
}
