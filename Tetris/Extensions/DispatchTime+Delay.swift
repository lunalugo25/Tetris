//
//  DispatchTime+Delay.swift
//  Tetris
//
//  Created by Luna, Jorge on 7/12/18.
//  Copyright © 2018 Luna, Jorge. All rights reserved.
//

import Foundation

extension DispatchTime {

    public static func after(_ delay: TimeInterval) -> DispatchTime {

        if delay < .infinity {

            return .now() + delay
        }

        return .now()
    }
}
