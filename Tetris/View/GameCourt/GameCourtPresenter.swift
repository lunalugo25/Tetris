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


    func viewDidLoad() {


        var columns = [[DrawableCollectionCellProtocol]]()

        for column in 0..<GameCourt.height {

            var rows = [DrawableCollectionCellProtocol]()
            let columnColor: UIColor = column%2 == 0 ? .blue: .red

            for row in 0..<GameCourt.width {


                let rowColor: UIColor = row%2 == 0 ? columnColor.darker: columnColor.lighter
                rows.append(GameCourtViewCellModel(color: rowColor))
            }

            columns.append(rows)
        }

        view?.setViewModel(columns)
    }
}

extension UIColor {

    var lighter: UIColor {
        return adjust()
    }

    var darker: UIColor {
        return adjust(by: -0.20)
    }

    private func adjust(by percentage: CGFloat = 0.20) -> UIColor {

        assert(percentage > 1.0 || percentage < 1.0, "The percentage should be between 0.0 - 1.0")

        var red:CGFloat = 0, green:CGFloat = 0, blue:CGFloat = 0, alpha:CGFloat = 0

        guard self.getRed(&red, green: &green, blue: &blue, alpha: &alpha) else {
            return UIColor()
        }

        return UIColor(red:     min(red     + percentage, 1.0),
                       green:   min(green   + percentage, 1.0),
                       blue:    min(blue    + percentage, 1.0),
                       alpha:   min(alpha   + percentage, 1.0))
    }
}
