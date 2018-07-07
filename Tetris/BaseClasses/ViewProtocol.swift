//
//  ViewProtocol.swift
//  Tetris
//
//  Created by Luna, Jorge on 7/7/18.
//  Copyright © 2018 Luna, Jorge. All rights reserved.
//

import UIKit

protocol ViewProtocol: class {

    func nyi(_ reason: String)
}

extension ViewProtocol {
    func nyi(_ reason: String = "") {

        let reason = reason.isEmpty ? "" : "\nReason: \(reason)"

        if let topViewController = UIApplication.shared.windows.first?.rootViewController {

            let alertController = UIAlertController(
                title:          "Not Yet Implemented",
                message:        "This feature is not yet implemented!\(reason)",
                preferredStyle: .alert
            )
            let okAction = UIAlertAction(
                title:   "Ok",
                style:   .default
            )

            alertController.addAction(okAction)

            topViewController.present(alertController, animated: true, completion: nil)
        }
    }
}
