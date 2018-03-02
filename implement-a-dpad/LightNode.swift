import SceneKit

final class LightNode: SCNNode {
    var ambientLight = SCNNode()
    var directionalLight = SCNNode()

    override init() {
        super.init()

        ambientLight.light = SCNLight()
        ambientLight.light?.type = .ambient
        directionalLight.light = SCNLight()
        directionalLight.light?.type = .directional

        // enable throwing shadow
        directionalLight.light?.castsShadow = true

        // have the light to the left
        directionalLight.position = SCNVector3(-5, 0, 0)

        // angle of the light
        directionalLight.eulerAngles = SCNVector3(
            x: 0,
            y: -getRadianFor(degree: 90),
            z: -getRadianFor(degree: 45)
        )

        addChildNode(ambientLight)
        addChildNode(directionalLight)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
