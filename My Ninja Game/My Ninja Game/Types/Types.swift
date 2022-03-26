//
//  Types.swift
//  My Ninja Game
//
//  Created by MacBook on 24.03.2022.
//

import Foundation

struct PhysicsCategory {
    static let Player:          UInt32 = 0b1    //1 - 00000001
    static let Wall:            UInt32 = 0b10   //2 - 00000010
    static let Score:           UInt32 = 0b100  //4 - 00000100
}

public let fontNamed = "Krungthep"

enum GameState: Int {
    case initial = 0, start, play, dead
}



