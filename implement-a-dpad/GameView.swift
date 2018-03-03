import SceneKit
import SpriteKit

/// Is used in Main.storyboard
/// under Identity Inspector
final class GameView: SCNView {

    // typically used for additional set up
    override func awakeFromNib() {
        super.awakeFromNib()

        setup2DOverlay()
    }

    func setup2DOverlay() {
        let viewHeight = bounds.size.height
        let viewWidth = bounds.size.width

        // initiate a sprite kit scene (the actual overlay)
        let sceneSize = CGSize(width: viewWidth, height: viewHeight)
        let skScene = SKScene(size: sceneSize)
        // Modify the SKScene's actual size to exactly match the SKView.
        skScene.scaleMode = .resizeFill

        let dpadShape = SKShapeNode(circleOfRadius: 75)
        dpadShape.strokeColor = .white
        dpadShape.lineWidth = 2.0

        // the position is initially at (0, 375) of the views coordinate system
        // the `position` of the dpadShape is at the middle of the shape
        // this is why we put it by the half of its width to the right
        // with a little offset/margin of 10. Same for the height.
        dpadShape.position.x = dpadShape.frame.size.width / 2 + 10
        dpadShape.position.y = dpadShape.frame.size.height / 2 + 10

        // add the dpad shape to the sprite kit scene
        skScene.addChild(dpadShape)

        // disables skScene to receive touch
        // so it goes through this layer
        // which means to our GameView scene
        skScene.isUserInteractionEnabled = false

        // assign the sprite kit scene to the scene kit view.
        overlaySKScene = skScene
    }

    func virtualDPad() -> CGRect {
        var vDPad = CGRect(x: 0, y: 0, width: 150, height: 150)
        vDPad.origin.y = bounds.size.height - vDPad.size.height - 10
        vDPad.origin.x = 10
        return vDPad
    }
}
