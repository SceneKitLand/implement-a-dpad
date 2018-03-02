import SceneKit

final class FloorNode: SCNNode {

    override init() {
        super.init()

        // infinite floor
        let floorGeometry = SCNFloor()
        floorGeometry.firstMaterial?.diffuse.contents = UIImage(named: "art.scnassets/grass.jpg")
        floorGeometry.firstMaterial?.diffuse.wrapS = .repeat
        floorGeometry.firstMaterial?.diffuse.wrapT = .repeat

        // the higher the number the more often the repetition (the smaller the image get)
        floorGeometry.firstMaterial?.diffuse.contentsTransform = SCNMatrix4MakeScale(25, 25, 25)

        let floorShape = SCNPhysicsShape(geometry: floorGeometry, options: nil)
        let floorBody = SCNPhysicsBody(type: .kinematic, shape: floorShape)

        physicsBody = floorBody
        geometry = floorGeometry
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
