//
//  GameScene.swift
//  Swift RPG
//
//  Created by Conner Evans on 29/07/2021.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let cam = SKCameraNode()
    let player = Player()
    
    override func didMove(to view: SKView) {
        
        player.position = CGPoint(x:100, y:100)
        player.scale(to: CGSize(width: 32, height: 32))
        self.addChild(player)
        
        
        camera = childNode(withName: "camera") as? SKCameraNode
        camera?.position = player.position
    }
    
    fileprivate func updateCamera(position: CGPoint) {
        camera?.run(SKAction.move(to: position, duration: 0.1))
        
    }
    
    override func keyDown(with event: NSEvent) {
        switch event.keyCode {
        case 0x31:
            print("keydown")
        default:
            print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
