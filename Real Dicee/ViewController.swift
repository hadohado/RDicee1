//
//  ViewController.swift
//  Real Dicee
//
//  Created by Angela Yu on 12/07/2017.
//  Copyright © 2017 Angela Yu. All rights reserved.
//

import UIKit
import SceneKit
import ARKit
import RealmSwift

class ViewController: UIViewController, ARSCNViewDelegate {

    var addOldDice = true
    
    let realm = try! Realm() // I add nov-5-2019
    
    var diceLocations: Results<DiceLocation>? // I add nov-5-2019
    
    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDiceLocations() // I add nov-5-2019 (load previous dice based on previous locations
        
        // Set the view's delegate
        sceneView.delegate = self
        
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]

//        let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
//        let sphere = SCNSphere(radius: 0.2)
//        let material = SCNMaterial()
//        material.diffuse.contents = UIImage(named: "art.scnassets/moon.jpg")
//        sphere.materials = [material]
//        let node = SCNNode()
//        node.position = SCNVector3(x: 0, y: 0.1, z: -0.5)
//        node.geometry = sphere
//        sceneView.scene.rootNode.addChildNode(node)

        sceneView.autoenablesDefaultLighting = true
      
        //***************************************************************
        // I add I move this from inside if() below to up here nov-5-5019
        // Create a new scene
        let diceScene = SCNScene(named: "art.scnassets/diceCollada.scn")!
        
        let lampScene = SCNScene(named: "art.scnassets/lamp_dae.scn")!
        ///        if let hitResult = results.first {

            // Create a new scene
            // let diceScene = SCNScene(named: "art.scnassets/diceCollada.scn")!

            if addOldDice == true {
            // I add nov-5-2019    add previous dices onto scene
            // if let diceNodeOld = diceScene.rootNode.childNode(withName: "Dice", recursively: false) {
        
//        // \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
//            if let diceNodeOld = diceScene.rootNode.childNode(withName: "Dice", recursively: true) {
//                if let mycount = diceLocations?.count {
//                    print("-------- mycount = ", mycount)
//                for i in 0...(mycount - 1) {
//                    print("--------x = ", diceLocations?[i].diceLocx as Any,
//                          " y = ", diceLocations?[i].diceLocy as Any,
//                          " z = ", diceLocations?[i].diceLocz as Any
//                     )
//                    diceNodeOld.position = SCNVector3(
//                        x: (diceLocations?[i].diceLocx)!,
//                        y: (diceLocations?[i].diceLocy)!,
//                        z: (diceLocations?[i].diceLocz)!
//                    )
//                    sceneView.scene.rootNode.addChildNode(diceNodeOld)
//                }
//                }
//            } // I add nov-5-2019    add previous dices onto scene
//        // \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
 
        // \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
        let ohOh = true
        if ohOh {
            if let diceNodeOld = diceScene.rootNode.childNode(withName: "Dice", recursively: true) {
                 print("--------x = ", diceLocations?[0].diceLocx as Any,
                          " y = ", diceLocations?[0].diceLocy as Any,
                          " z = ", diceLocations?[0].diceLocz as Any
                     )
                    diceNodeOld.position = SCNVector3(
                        x: (diceLocations?[0].diceLocx)!,
                        y: (diceLocations?[0].diceLocy)!,
                        z: (diceLocations?[0].diceLocz)!
                    )
                    sceneView.scene.rootNode.addChildNode(diceNodeOld)
                diceNodeOld.position = SCNVector3(
                    x: (diceLocations?[2].diceLocx)!,
                    y: (diceLocations?[2].diceLocy)!,
                    z: (diceLocations?[2].diceLocz)!
                )
                sceneView.scene.rootNode.addChildNode(diceNodeOld)
            } // I add nov-5-2019    add previous dices onto scene
        }
        // \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
        
        // \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
            // if let diceNodeOld1 = diceScene.rootNode.childNode(withName: "Dice", recursively: true) {
            if let diceNodeOld1 = lampScene.rootNode.childNode(withName: "Circle", recursively: true) {
                 print("--------x 1 = ", diceLocations?[0].diceLocx as Any,
                          " y 1 = ", diceLocations?[0].diceLocy as Any,
                          " z 1 = ", diceLocations?[0].diceLocz as Any
                     )
                    diceNodeOld1.position = SCNVector3(
                        x: (diceLocations?[1].diceLocx)!,
                        y: (diceLocations?[1].diceLocy)!,
                        z: (diceLocations?[1].diceLocz)!
                    )
                    sceneView.scene.rootNode.addChildNode(diceNodeOld1)
            } // I add nov-5-2019    add previous dices onto scene
            else {
                print ("no diceNodeOld1 !!! ")
                }
        // \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
                
            } // if addOldDice == true
        
        //***************************************************************
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()
        
        configuration.planeDetection = .horizontal
        
        // Run the view's session
        sceneView.session.run(configuration)
        
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            
            let touchLocation = touch.location(in: sceneView)
            
            let results = sceneView.hitTest(touchLocation, types: .existingPlaneUsingExtent)
 

            // I add I move this from inside if() below to up here nov-5-5019
            // Create a new scene
            let diceScene = SCNScene(named: "art.scnassets/diceCollada.scn")!


/*
            ///        if let hitResult = results.first {

                // Create a new scene
                // let diceScene = SCNScene(named: "art.scnassets/diceCollada.scn")!

                if addOldDice == true {
                // I add nov-5-2019    add previous dices onto scene
                if let diceNodeOld = diceScene.rootNode.childNode(withName: "Dice", recursively: true) {
                    
                    if let mycount = diceLocations?.count {
                        print("-------- mycount = ", mycount)
                    for i in 0...(mycount - 1) {
                        print("--------x = ", diceLocations?[i].diceLocx )
                        diceNodeOld.position = SCNVector3(
                            x: (diceLocations?[i].diceLocx)!,
                            y: (diceLocations?[i].diceLocy)!,
                            z: (diceLocations?[i].diceLocz)!
                        )
                        sceneView.scene.rootNode.addChildNode(diceNodeOld)
                    }
                    }
                    
                } // I add nov-5-2019    add previous dices onto scene
                } // if addOldDice == true
*/
            
            if let hitResult = results.first {
                if addOldDice == false {
                // if addOldDice == true {
                if let diceNode = diceScene.rootNode.childNode(withName: "Dice", recursively: true) {
                    diceNode.position = SCNVector3(
                        x: hitResult.worldTransform.columns.3.x,
                        y: hitResult.worldTransform.columns.3.y + diceNode.boundingSphere.radius,
                        z: hitResult.worldTransform.columns.3.z
                    )

                    // I add nov-5-2019  save dice location to Realm database
                    let diceLocation = DiceLocation()
                    diceLocation.diceLocx = hitResult.worldTransform.columns.3.x
                    diceLocation.diceLocy = hitResult.worldTransform.columns.3.y + diceNode.boundingSphere.radius
                    diceLocation.diceLocz = hitResult.worldTransform.columns.3.z
                    self.save(diceLocation: diceLocation)
                    sceneView.scene.rootNode.addChildNode(diceNode)
                    
                    let randomX = Float((arc4random_uniform(4) + 1)) * (Float.pi/2)
                    //        let randomY = Double((arc4random_uniform(10) + 11)) * (Double.pi/2)
                    let randomZ = Float((arc4random_uniform(4) + 1)) * (Float.pi/2)
                    
                    diceNode.runAction(SCNAction.rotateBy(x: CGFloat(randomX * 5), y: 0, z: CGFloat(randomZ * 5), duration: 0.5))
                }
            } // loop
            }
        }
    }
    
    // MARK: - ARSCNViewDelegate
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        
        if anchor is ARPlaneAnchor {
            
            print("plane detected")
            
            let planeAnchor = anchor as! ARPlaneAnchor

            let plane = SCNPlane(width: CGFloat(planeAnchor.extent.x), height: CGFloat(planeAnchor.extent.z))
            
            let gridMaterial = SCNMaterial()
            gridMaterial.diffuse.contents = UIImage(named: "art.scnassets/grid.png")
            plane.materials = [gridMaterial]
            
            let planeNode = SCNNode()

            planeNode.geometry = plane
            planeNode.position = SCNVector3(planeAnchor.center.x, 0, planeAnchor.center.z)
            planeNode.transform = SCNMatrix4MakeRotation(-Float.pi/2, 1, 0, 0)
            
            node.addChildNode(planeNode)
            
        } else {
            return
        }
        //guard let planeAnchor = anchor as? ARPlaneAnchor else {return}
    }
    
    //---------------------------------------------
    // save dice node location
    //---------------------------------------------
    //MARK: - Data Manipulation Methods
    func save(diceLocation: DiceLocation) {
        do {
            try realm.write { realm.add(diceLocation) }
        } catch { print("Error saving category \(error)") }
        // tableView.reloadData()
    }
    
    func loadDiceLocations() {
        diceLocations  = realm.objects(DiceLocation.self)
        print("number of dice in Realm database = ", diceLocations?.count ?? 0)
        // tableView.reloadData()
    }
}
