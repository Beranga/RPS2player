//
//  Sign.swift
//  RPS II
//
//  Created by Cesareo on 22/05/20.
//  Copyright © 2020 Cesareo. All rights reserved.
//

import Foundation

enum Sign {
    case rock, paper, sissors
    
    func emoji() -> String {
        switch self {
        case .rock:
            return "👊"
        case .paper:
            return "✋"
        case .sissors:
            return "✌️"
        }
    }
}

func Winner(playerTurn: Sign, computerTurn: Sign) -> GameState {

    switch playerTurn {
    case .rock:
        if computerTurn == .sissors {
           return .win
        } else {
            if computerTurn == .paper {
                return .lose
                } else {
                return .draw
                }
            }
        
    case .paper:
        if computerTurn == .sissors {
            return .lose
        } else {
            if computerTurn == .rock {
                return .win
                } else {
                return .draw
                }
            }
    case .sissors:
        if computerTurn == .paper {
            return .win
        } else {
            if computerTurn == .rock {
                return .lose
                } else {
                return .draw
                }
            }
    }
}
  
