//
//  NSLayoutConstraint+Multiplier.swift
//  Tetris
//
//  Created by Luna, Jorge on 7/8/18.
//  Copyright © 2018 Luna, Jorge. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {

    func withMultiplier(_ multiplier: CGFloat) -> NSLayoutConstraint {
        return NSLayoutConstraint(item:         firstItem!,
                                  attribute:    firstAttribute,
                                  relatedBy:    relation,
                                  toItem:       secondItem,
                                  attribute:    secondAttribute,
                                  multiplier:   multiplier,
                                  constant:     constant)
    }
}
