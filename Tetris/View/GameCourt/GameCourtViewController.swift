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
    @IBOutlet weak var gridWidthConstraint: NSLayoutConstraint!

    private var viewModel = [[DrawableCollectionCellProtocol]]() {
        didSet {
            collectionView.reloadData()
        }
    }
    private var gridSize = GridSize.zero
    private var cellSize = CGSize.zero

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter?.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        presenter?.viewDidAppear()
    }

    @IBAction func didSwipe(_ sender: Any) {

        if let swipe = sender as? UISwipeGestureRecognizer {

            switch swipe.direction {
            case .left:     presenter?.didSwipeLeft()
            case .right:    presenter?.didSwipeRight()
            default:        break
            }
        }
    }

    @IBAction func didRotate(_ sender: Any) {

        presenter?.didTapRotate()
    }

    @IBAction func didDrag(_ recognizer: UIPanGestureRecognizer) {

        let translation = recognizer.translation(in: recognizer.view)
        let velocity = recognizer.velocity(in: recognizer.view)
        let state = recognizer.state


        switch recognizer.state {
        case .began:
            let location = recognizer.location(in: recognizer.view)
            presenter?.didInitDrag(in: location.x/(recognizer.view?.frame.width ?? 1))
        default:

            print("State: \(state), translation: \(translation), velocity: \(velocity)")
        }
    }

    func setViewModel(_ newViewModel: [[DrawableCollectionCellProtocol]]) {

        gridSize = GridSize(columns: newViewModel.count, rows: newViewModel.first?.count ?? 1)

        let cellSide:CGFloat = collectionView.frame.height/CGFloat(gridSize.columns)
        cellSize = CGSize(width: cellSide, height: cellSide)

        gridWidthConstraint.constant = collectionView.frame.height * CGFloat(gridSize.rows)/CGFloat(gridSize.columns)
        collectionView.setNeedsLayout()

        self.viewModel = newViewModel
    }

    private func setupView() {
        collectionView.backgroundColor = .clear
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

extension GameCourtViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return cellSize
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        return 0
    }
}


extension UIGestureRecognizerState: CustomStringConvertible {
    public var description: String {
        switch self {
        case .possible:     return "possible"
        case .began:        return "began"
        case .changed:      return "changed"
        case .ended:        return "ended"
        case .cancelled:    return "cancelled"
        case .failed:       return "failed"
        }
    }
}
