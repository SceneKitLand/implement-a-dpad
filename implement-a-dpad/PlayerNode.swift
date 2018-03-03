import SceneKit

final class PlayerNode: SCNNode {

    override init() {
        super.init()

        // create player
        let playerGeometry = SCNBox(width: 1, height: 1, length: 1, chamferRadius: 0)
        playerGeometry.firstMaterial?.diffuse.contents = UIColor.brown

        position = SCNVector3(x: 0, y: 0.5, z: 0)

        // give the looks
        geometry = playerGeometry

        // define shape, here a box around the player
        let shape = SCNPhysicsShape(
            geometry: playerGeometry,
            // default is box, give it a physics shape near to its looking shape
            options: [SCNPhysicsShape.Option.type: SCNPhysicsShape.ShapeType.boundingBox]
        )

        // assign physics body based on geometry body (here: player)
        physicsBody = SCNPhysicsBody(type: .kinematic, shape: shape)
        physicsBody?.angularVelocityFactor = SCNVector3Zero
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var directionAngle: SCNFloat = 0.0 {
        didSet {
            if directionAngle != oldValue {
                // action that rotates the node to an absolute angle in radian.
                let action = SCNAction.rotateTo(
                    x: 0.0,
                    y: CGFloat(directionAngle),
                    z: 0.0,
                    duration: 0.1, usesShortestUnitArc: true
                )
                runAction(action)
            }
        }
    }

    let speed: Float = 0.3

    func walkInDirection(_ direction: float3) {
        let currentPosition = float3(position)
        position = SCNVector3(currentPosition + direction * speed)
    }
}
