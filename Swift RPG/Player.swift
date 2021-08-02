//
//  Player.swift
//  Swift RPG
//
//  Created by Conner Evans on 02/08/2021.
//


import Foundation
import SpriteKit

class Player: SKSpriteNode {
    
    var playerSize: CGSize = CGSize(width:32, height:32)
    var textureAtlas: SKTextureAtlas = SKTextureAtlas(named:"player")
    var playerFacing: String = "up"

    
    init() {
        super.init(texture: nil, color: .clear, size:playerSize)
        
        let bodyTexture = textureAtlas.textureNamed("player_up_still")
        self.physicsBody = SKPhysicsBody(texture: bodyTexture, size: self.size)
        self.physicsBody?.linearDamping = 0.9
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.mass = 30
        self.physicsBody?.allowsRotation = false
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func walkAnimationUp() {
    
        
        let moveUp = SKAction.moveBy(x: 0.0, y: 32, duration: 0.1)
        let walkFrames: [SKTexture] = [textureAtlas.textureNamed("player_up_1"),
                                       textureAtlas.textureNamed("player_up_2")]
        
        let walkAction = SKAction.animate(with: walkFrames, timePerFrame: 1.5)
        
        let animation = SKAction.group([SKAction.repeatForever(walkAction), moveUp])
        
        self.run(animation, withKey: "walkingAnimation")
        
    }

    
    func walkAnimationDown() {
        
        let moveDown = SKAction.moveBy(x: 0.0, y: -32, duration: 0.1)
        let walkFrames: [SKTexture] = [textureAtlas.textureNamed("player_down_1"),
                                       textureAtlas.textureNamed("player_down_2")]
        
        let walkAction = SKAction.animate(with: walkFrames, timePerFrame: 0.2)
        
        let animation = SKAction.group([moveDown,walkAction])
        
        self.run(animation)
    }
    
    func walkAnimationRight() {
        
        let moveRight = SKAction.moveBy(x: 32, y: 0.0, duration: 0.1)
        let walkFrames: [SKTexture] = [textureAtlas.textureNamed("player_right_1"),
                                       textureAtlas.textureNamed("player_right_2")]
        
        let walkAction = SKAction.animate(with: walkFrames, timePerFrame: 0.2)
        
        let animation = SKAction.group([moveRight,walkAction])
        
        self.run(animation)
        
    }
    
    func walkAnimationLeft() {
        
        let moveLeft = SKAction.moveBy(x: -32, y: 0.0, duration: 0.1)
        let walkFrames: [SKTexture] = [textureAtlas.textureNamed("player_left_1"),
                                       textureAtlas.textureNamed("player_left_2")]
        
        let walkAction = SKAction.animate(with: walkFrames, timePerFrame: 0.2)
        
        let animation = SKAction.group([moveLeft,walkAction])
        
        self.run(animation)
    }
    
}
