//
//  PresenterProtocol.swift
//  Tetris
//
//  Created by Luna, Jorge on 7/7/18.
//  Copyright © 2018 Luna, Jorge. All rights reserved.
//

import Foundation

protocol PresenterProtocol: class {

    func viewDidLoad()

    func viewWillAppear()
    func viewDidAppear()

    func viewWillDisappear()
    func viewDidDisappear()

    func viewDidUnload()
}

extension PresenterProtocol {

    func viewDidLoad() {}

    func viewWillAppear() {}
    func viewDidAppear() {}

    func viewWillDisappear() {}
    func viewDidDisappear() {}

    func viewDidUnload() {}
}
