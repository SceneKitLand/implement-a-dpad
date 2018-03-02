import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {
    var gameView: SCNView!
    var scene: SCNScene!

    override func viewDidLoad() {
        gameView = view as! SCNView
        scene = SCNScene()
        gameView.scene = scene

        let lightNode = LightNode()
        let cameraNode = CameraNode()
        let floorNode = FloorNode()
        let playerNode = PlayerNode()

        scene.rootNode.addChildNode(lightNode)
        scene.rootNode.addChildNode(cameraNode)
        scene.rootNode.addChildNode(floorNode)
        scene.rootNode.addChildNode(playerNode)

        gameView.allowsCameraControl = true
    }
}
