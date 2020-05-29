//
//  GameState.swift
//  RPS II
//
//  Created by Cesareo on 22/05/20.
//  Copyright © 2020 Cesareo. All rights reserved.
//

import Foundation

enum GameState {
    case start, win, lose, draw
    func UIstate() -> String{
        switch self {
        case .start:
            return "¡Sin... cham... pú!"
        case .win:
            return "¡Perdiste!"
        case .lose:
            return "¡Ganaste!"
        case .draw:
            return "¡Empate!"
        }
       
    }
    
}

