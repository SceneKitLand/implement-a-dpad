import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {
    var gameView: GameView {
        return view as! GameView
    }

    var scene: SCNScene!
    let playerNode = PlayerNode()
    let cameraNode = CameraNode()

    override func viewDidLoad() {
        scene = SCNScene()
        gameView.scene = scene

        gameView.delegate = self
        gameView.isPlaying = true

        let lightNode = LightNode()
        let floorNode = FloorNode()

        scene.rootNode.addChildNode(lightNode)
        scene.rootNode.addChildNode(cameraNode)
        scene.rootNode.addChildNode(floorNode)
        scene.rootNode.addChildNode(playerNode)
    }

    var touch: UITouch?
    var direction = float2(0, 0)
}

extension GameViewController {

    // store touch in global scope
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touch = touches.first
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {

        if let touch = touch {

            // check whether our touch is within our dpad
            let touchLocation = touch.location(in: self.view)
            if gameView.virtualDPad().contains(touchLocation) {

                let middleOfCircleX = gameView.virtualDPad().origin.x + 75
                let middleOfCircleY = gameView.virtualDPad().origin.y + 75

                let lengthOfX = Float(touchLocation.x - middleOfCircleX)
                let lengthOfY = Float(touchLocation.y - middleOfCircleY)

                direction = float2(x: lengthOfX, y: lengthOfY)
                direction = normalize(direction)

                let degree = atan2(direction.x, direction.y)
                playerNode.directionAngle = degree
            }
        }
    }
}

extension GameViewController: SCNSceneRendererDelegate {

    func renderer(_ renderer: SCNSceneRenderer, updateAtTime time: TimeInterval) {

        let directionInV3 = float3(x: direction.x, y: 0, z: direction.y)
        playerNode.walkInDirection(directionInV3)

        // let camera follow player
        cameraNode.position.x = playerNode.presentation.position.x
        cameraNode.position.z = playerNode.presentation.position.z + CameraNode.offset
    }
}
