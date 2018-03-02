import SceneKit

final class CameraNode: SCNNode {
    static var offset: Float = 5

    override init() {
        super.init()

        camera = SCNCamera()
        position = SCNVector3(x: 0, y: 10, z: CameraNode.offset)
        eulerAngles = SCNVector3(
            x: -getRadianFor(degree: 60),
            y: 0,
            z: 0
        )
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
