//
//  DiceLocation.swift
//  RDicee1
//
//  Created by ha tuong do on 11/4/19.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import Foundation
import UIKit
import SceneKit
import ARKit
import RealmSwift

class DiceLocation: Object {
    
    // @objc dynamic var diceLoc = SCNVector3()
    @objc dynamic var diceLocx: Float = 0
    @objc dynamic var diceLocy: Float = 0
    @objc dynamic var diceLocz: Float = 0
    
    // @objc dynamic var name: String = ""
    // @objc dynamic var colour: String = ""
    // let items = List<Item>()
}
