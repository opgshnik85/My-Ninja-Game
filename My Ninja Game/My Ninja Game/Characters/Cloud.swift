//
//  Cloud.swift
//  My Ninja Game
//
//  Created by MacBook on 24.03.2022.
//

import SpriteKit

class Cloud: SKSpriteNode {
    
    var clouds:[Cloud] = []
    
    func setupClouds() {
        for i in 1...3 {
            let cloud = Cloud(imageNamed: "cloud\(i)")
            cloud.name = "Cloud"
            cloud.zPosition = 1.0
            cloud.alpha = 0.5
            cloud.setScale(2.0)
            clouds.append(cloud)
            
        }
    }
    
    func moveCloud(_ scene: SKScene) {
        scene.enumerateChildNodes(withName: "Cloud") { (node, _) in
            let node = node as! SKSpriteNode
            node.position.x -= 3.0
            
        }
    }
}
