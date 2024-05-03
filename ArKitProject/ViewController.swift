//
//  ViewController.swift
//  ArKitProject
//
//  Created by Mehmet Jiyan Atalay on 28.02.2024.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        /*
        let myBOx = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
        
        let boxMaterial = SCNMaterial()
        boxMaterial.diffuse.contents = UIImage(named: "art.scnassets/wall.png")
        
        myBOx.materials = [boxMaterial]
        
        let node = SCNNode()
        
        node.position = SCNVector3(x: 0, y: 0.1, z: -1)
        node.geometry = myBOx
        
        sceneView.scene.rootNode.addChildNode(node)*/
        
        let mySphere = createSphere(radius: 0.1, content: "wall.png", vector:SCNVector3(x: 0, y: 0.1, z: -0.5))
        
        sceneView.scene.rootNode.addChildNode(mySphere)
        sceneView.automaticallyUpdatesLighting = true
        
        
        
        
        /*
        // Create a new scene
        let shipScene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // Set the scene to the view
        sceneView.scene = shipScene
        
        for node in sceneView.scene.rootNode.childNodes {
            
            let moveShip = SCNAction.moveBy(x: 0, y: 0.5, z: -0.5, duration: 1)
            let fadeOut = SCNAction.fadeOpacity(to: 0.5, duration: 1)
            let fadeIn = SCNAction.fadeOpacity(to: 1, duration: 1)
            let sequence = SCNAction.sequence([moveShip,fadeOut,fadeOut])
            
            let repeatForever = SCNAction.repeatForever(sequence)
            
            node.runAction(repeatForever)
        }*/
    }
    
    func createSphere(radius : CGFloat, content : String, vector : SCNVector3) -> SCNNode{
        let mySphere = SCNSphere(radius: radius)
        
        let sphereMaterial = SCNMaterial()
        sphereMaterial.diffuse.contents = UIImage(named: "art.scnassets/\(content)")
        
        mySphere.materials = [sphereMaterial]
        
        let nodeSphere = SCNNode()
        
        nodeSphere.position = vector
        nodeSphere.geometry = mySphere
        
        return nodeSphere
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
