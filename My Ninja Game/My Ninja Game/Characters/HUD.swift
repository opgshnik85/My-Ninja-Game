//
//  HUD.swift
//  My Ninja Game
//
//  Created by MacBook on 24.03.2022.
//

import SpriteKit

enum HUDSettings {
    static let score = "Score"
    static let highscore = "Highscore"
    static let tapToStart = "Tap To Start"
    static let gameOver = "Game Over"
}

class HUD: SKNode {
    
    var scoreLabel: SKLabelNode!
    var highScoreLabel: SKLabelNode!
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addLabel(_ name: String, text: String, fontSize: CGFloat, pos: CGPoint) {
        let label = SKLabelNode()
        label.fontName = fontNamed
        label.name = name
        label.text = text
        label.fontSize = fontSize
        label.position = pos
        label.zPosition = 50.0
        addChild(label)
    }
    
    func setupScoreLbl(_ score: Int) {
        guard let scene = scene as? GameScene else { return }
        let pos = CGPoint(x: 40.0, y: scene.playableRect.maxY - 40.0)
        addLabel(HUDSettings.score, text: "Score: \(score)", fontSize: 70.0, pos: pos)
        scoreLabel = childNode(withName: HUDSettings.score) as? SKLabelNode
        scoreLabel.horizontalAlignmentMode = .left
        scoreLabel.verticalAlignmentMode = .top
    }
    
    func setupHighscoreLbl(_ highscore: Int) {
        guard let scene = scene as? GameScene else { return }
        let pos = CGPoint(x: scene.playableRect.maxX - 40.0, y: scene.playableRect.maxY - 40.0)
        addLabel(HUDSettings.highscore, text: "Highscore: \(highscore)", fontSize: 70.0, pos: pos)
        highScoreLabel = childNode(withName: HUDSettings.highscore) as? SKLabelNode
        highScoreLabel.horizontalAlignmentMode = .right
        highScoreLabel.verticalAlignmentMode = .top
    }
    
    func addLabel(fontSize: CGFloat, name: String, text: String) {
        guard let scene = scene as? GameScene else { return }
        let pos = CGPoint(x: scene.playableRect.width/2.0,
                          y: scene.playableRect.height/2.0 + 400.0)
        addLabel(name, text: text, fontSize: fontSize, pos: pos)
    }
    
    func setupGameState(from: GameState, to: GameState) {
        clearUI(gameState: from)
        updateUI(gameState: to)
    }
    
    func updateUI(gameState: GameState) {
        switch gameState {
        case .start:
            addLabel(fontSize: 150.0, name: HUDSettings.tapToStart, text: HUDSettings.tapToStart)
        case .dead:
            addLabel(fontSize: 200.0, name: HUDSettings.gameOver, text: HUDSettings.gameOver)
        default: break
        }
    }
    
    func clearUI(gameState: GameState) {
        switch gameState {
        case .start:
            childNode(withName: HUDSettings.tapToStart)?.removeFromParent()
        case .dead:
            childNode(withName: HUDSettings.gameOver)?.removeFromParent()
        default: break
        }
    }
}

