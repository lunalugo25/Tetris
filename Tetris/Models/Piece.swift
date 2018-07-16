//
//  Piece.swift
//  Tetris
//
//  Created by jorge luna on 7/2/18.
//  Copyright © 2018 Jorge Luna. All rights reserved.
//

import Foundation

typealias PieceRepresentation = ([[Bool]])
typealias PieceBlocks = ([IndexPath])

enum PieceType {
    case line
    case jay
    case el
    case square
    case es
    case ti
    case zeta

    func get(for direction: PieceDirection) -> PieceRepresentation {
        switch (self,
                direction) {

        case (.line, .up),
             (.line, .down):
            return [[true],     //X
                    [true],     //X
                    [true],     //X
                    [true]]     //X

        case (.line, .right),
             (.line, .left):
            return [[true,true,true,true]]      //XXXX

        case (.jay, .up):
            return [[false, true],  //OX
                    [false, true],  //OX
                    [true,  true]]  //XX

        case (.jay, .right):
            return [[true],                     //X
                    [true,  true,  true]]       //XXX

        case (.jay, .down):
            return [[true,  true],      //OX
                    [true,  false],     //OX
                    [true,  false]]     //XX

        case (.jay, .left):
            return [[true,  true,  true],       //XXX
                    [false, false, true]]       //OOX

        case (.el, .up):
            return [[true],         //X
                    [true],         //X
                    [true,  true]]  //XX

        case (.el, .right):
            return [[true,  true,  true],   //XXX
                    [true]]                 //X

        case (.el, .down):
            return [[true,   true],     //XX
                    [false,  true],     //OX
                    [false,  true]]     //OX

        case (.el, .left):
            return [[false, false,  true],  //OOX
                    [true,  true,   true]]  //XXX

        case (.square, _):
            return [[true,true],    //XX
                    [true,true]]    //XX

        case (.es, .up),
             (.es, .down):
            return [[false,  true,  true],  //OXX
                    [true,   true]]         //XX

        case (.es, .right),
             (.es, .left):
            return [[true],             //X
                    [true,   true],     //XX
                    [false,  true]]     //OX

        case (.ti, .up):
            return [[true,   true,   true],     //XXX
                    [false,  true]]             //OX

        case (.ti, .right):
            return [[false,  true],     //OX
                    [true,   true],     //XX
                    [false,  true]]     //OX

        case (.ti, .down):
            return [[false,  true],             //OX
                    [true,   true,   true]]     //XXX

        case (.ti, .left):
            return [[true],             //X
                    [true,   true],     //XX
                    [true]]             //X

        case (.zeta, .up),
             (.zeta, .down):
            return [[true,  true],          //XX
                    [false,  true,   true]] //OXX

        case (.zeta, .right),
             (.zeta, .left):
            return [[false,  true],     //OX
                    [true,   true],     //XX
                    [true]]             //X
        }
    }

    func width(for direction: PieceDirection) -> Int {

        return get(for: direction).map { $0.count }.max() ?? 0
    }

    func space(for direction: PieceDirection) -> IndexPath {
        switch (self, direction)  {
        case (.line, .up):      return IndexPath(row: -1, section:  1)
        case (.line, .right):   return IndexPath(row:  2, section: -1)
        case (.line, .down):    return IndexPath(row: -2, section:  2)
        case (.line, .left):    return IndexPath(row: -2, section: -2)

        case (.jay, .right):    return IndexPath(row:  1, section:  0)
        case (.jay, .down):     return IndexPath(row: -1, section:  1)
        case (.jay, .left):     return IndexPath(row:  0, section: -1)

        case (.el, .up):        return IndexPath(row: -1, section:  1)
        case (.el, .right):     return IndexPath(row:  0, section: -1)
        case (.el, .left):      return IndexPath(row:  1, section:  0)

        case (.es, .up):        return IndexPath(row:  0, section: -1)
        case (.es, .down):      return IndexPath(row:  1, section:  0)
        case (.es, .left):      return IndexPath(row: -1, section:  1)

        case (.ti, .up):        return IndexPath(row:  0, section: -1)
        case (.ti, .down):      return IndexPath(row:  1, section:  0)
        case (.ti, .left):      return IndexPath(row: -1, section:  1)

        case (.zeta, .up):      return IndexPath(row:  0, section: -1)
        case (.zeta, .down):    return IndexPath(row:  1, section:  0)
        case (.zeta, .left):    return IndexPath(row: -1, section:  1)

        default:                return IndexPath(row:  0, section:  0)
        }
    }
}

enum PieceDirection {
    case up
    case right
    case down
    case left
}

struct Piece {
    let type: PieceType
    var direction: PieceDirection
    var currentPosition: IndexPath
}

extension Piece {
    init(type: PieceType) {
        self.type = type
        self.direction = .up
        self.currentPosition = IndexPath(row: 0, section: 0)
    }

    func getBlocks(for position: IndexPath) -> PieceBlocks {

        var blocks: PieceBlocks = []

        let representable = type.get(for: direction)

        var indexSection = 0
        for column in representable {

            for (indexRow, row) in column.enumerated() {
                if row {

                    blocks.append(IndexPath(row: position.row + indexRow,
                                            section: position.section + indexSection))
                }
            }
            indexSection += 1
        }

        return blocks
    }

    mutating func rotate() {

        let space = type.space(for: direction)

        currentPosition = IndexPath(row:      max(space.row + currentPosition.row, 0),
                             section:  max(space.section + currentPosition.section, 0))

        switch direction {
        case .up:     direction = .right
        case .right:  direction = .down
        case .down:   direction = .left
        case .left:   direction = .up
        }
    }
}
