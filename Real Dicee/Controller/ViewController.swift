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

import SwipeCellKit

class ViewController: UIViewController, ARSCNViewDelegate {

    var textField = UITextField()
    // textField.text = "this is dummy"
    
    var addOldDice = true
    
    let realm = try! Realm() // I add nov-5-2019
    
    var diceLocations: Results<DiceLocation>? // I add nov-5-2019
    
    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.text = "dummy start"
        
        loadDiceLocations() // I add nov-5-2019 (load previous dice based on previous locations
        
        // Set the view's delegate
        sceneView.delegate = self
        
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]

        sceneView.autoenablesDefaultLighting = true
      
        //***************************************************************
        // I add I move this from inside if() below to up here nov-5-5019
        // Create a new scene
        // let diceScene = SCNScene(named: "art.scnassets/diceCollada.scn")!
        
        let oldDiceScene = SCNScene(named: "art.scnassets/diceCollada.scn")!
        
        let lampScene = SCNScene(named: "art.scnassets/lamp_dae.scn")!
        
        
        
        if !addOldDice {
        // if let mycount = diceLocations?.count {
            // if mycount == 0{
            // print("just starting, number of dice is 0")
                
            let diceLocation = DiceLocation()
            diceLocation.diceLocx = 0.2
            diceLocation.diceLocy = 0
            diceLocation.diceLocz = -0.5
            self.save(diceLocation: diceLocation)
            
            let diceLocationa = DiceLocation()
            diceLocationa.diceLocx = 0.5
            diceLocationa.diceLocy = 0
            diceLocationa.diceLocz = -0.7
            self.save(diceLocation: diceLocationa)
            // }
        }
        
        
        
        
            if addOldDice == true {
 
        // \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
        let ohOh = true
        if ohOh {
            if let mycount = diceLocations?.count {
                print(" !!!!!!!!! mycount = ", mycount)
                // location 0 is used to display lamp
                // we use location 1 to max to display dice
                for i in 1...(mycount - 1) {
                    print("--> i = ", i)
            // if let diceNodeOld = oldDiceScene.rootNode.childNode(withName: "Dice", recursively: true) {
                    if let diceNodeOld = oldDiceScene.rootNode.childNode(withName: "Dice", recursively: true) {
                // let oldDiceScene = SCNScene(named: "art.scnassets/diceCollada.scn")!
                 print(" i = ", i, " -------- x OLD = ", diceLocations?[i].diceLocx as Any, " y = ", diceLocations?[i].diceLocy as Any, " z = ", diceLocations?[i].diceLocz as Any )
                    diceNodeOld.position = SCNVector3(
                        x: (diceLocations?[i].diceLocx)!,
                        y: (diceLocations?[i].diceLocy)!,
                        z: (diceLocations?[i].diceLocz)!    )
                    sceneView.scene.rootNode.addChildNode(diceNodeOld)
            } // I add nov-5-2019    if let diceNodeOld =
            else {
                let oldDiceScene = SCNScene(named: "art.scnassets/diceCollada.scn")!
                
                    print("something strange here i = ", i)
            let diceNodeOld = oldDiceScene.rootNode.childNode(withName: "Dice", recursively: true)
                        diceNodeOld?.position = SCNVector3(
                        x: (diceLocations?[i].diceLocx)!,
                        y: (diceLocations?[i].diceLocy)!,
                        z: (diceLocations?[i].diceLocz)!    )
                        sceneView.scene.rootNode.addChildNode(diceNodeOld!)
            }
            } // for i in ...
            } // let mycount =
        }
        
        // \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
            if let diceNodeOld1 = lampScene.rootNode.childNode(withName: "Circle", recursively: true) {
                 print("--------x LAMP = ", diceLocations?[0].diceLocx as Any,
                          " y  = ", diceLocations?[0].diceLocy as Any,
                          " z  = ", diceLocations?[0].diceLocz as Any
                     )
                    diceNodeOld1.position = SCNVector3(
                        x: (diceLocations?[0].diceLocx)!,
                        y: (diceLocations?[0].diceLocy)!,
                        z: (diceLocations?[0].diceLocz)!
                    )
                    sceneView.scene.rootNode.addChildNode(diceNodeOld1)
            } // I add nov-5-2019    add previous dices onto scene
            else {  print ("no diceNodeOld1 !!! ")   }

                
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
         
            
            ///////////////////////////////////////////////////////////
            let resultsFeaturePoint = sceneView.hitTest(touchLocation, types: .featurePoint)

            if let hitResult = resultsFeaturePoint.first {
                // if addOldDice == false {
                if addOldDice == true {

//                    //================================
//                    // var textField = UITextField()
//                    let alert = UIAlertController(title: "Add New Thing", message: "", preferredStyle: .alert)
//                    let action = UIAlertAction(title: "Add", style: .default) { (action) in
//                        print("AlertACtion --------------- = ", self.textField.text!)
//                    }
//                    alert.addAction(action)
//                    alert.addTextField { (field) in
//                        self.textField = field
//                        self.textField.placeholder = "Add a new thing"
//                    }
//                    present(alert, animated: true, completion: nil)
                    //,,,,,,,,,,,,,,,,,,,,,,,,,,,
                    
                let diceScene = SCNScene(named: "art.scnassets/Orange.scn")!
                if let diceNode = diceScene.rootNode.childNode(withName: "Orange", recursively: true) {
                    diceNode.position = SCNVector3(
                        x: 0, y: 0, z: -0.05
                        )
//                        x: hitResult.worldTransform.columns.3.x,
//                        y: hitResult.worldTransform.columns.3.y + diceNode.boundingSphere.radius,
//                        z: hitResult.worldTransform.columns.3.z
                    // )

                    // I add nov-5-2019  save dice location to Realm database
                    let diceLocation = DiceLocation()
                    diceLocation.diceLocx = hitResult.worldTransform.columns.3.x
                    diceLocation.diceLocy = hitResult.worldTransform.columns.3.y
                    diceLocation.diceLocz = hitResult.worldTransform.columns.3.z
                    // diceLocation.type = "orange"
      
    // MARK - this is a popup
                    var mypopup = PopupCls()
                    
                    //================================
                    
                    // var textField = UITextField()
    var enablePopup = false
                    if enablePopup {
                    let alert = UIAlertController(title: "Add New Thing", message: "", preferredStyle: .alert)
                    let action = UIAlertAction(title: "Add", style: .default) { (action) in
                        print("AlertACtion --------------- = ", self.textField.text!)
                    }
                    alert.addAction(action)
                    alert.addTextField { (field) in
                        self.textField = field
                        self.textField.placeholder = "Add a new thing"
                    }
                    present(alert, animated: true, completion: nil)
                    }
                    
                    //,,,,,,,,,,,,,,,,,,,,,,,,,,,
                    
                    diceLocation.name = textField.text! // add nov-12
                    print(">>>>>>>>>> feature point diceLocation.name = ", diceLocation.name)
                    
                    diceLocation.name = "fake" + "\(diceLocation.diceLocx)"
                    
                    print(">>>>>>>>>> feature point diceLocation.name = ", diceLocation.name)
                    self.save(diceLocation: diceLocation)
                    sceneView.scene.rootNode.addChildNode(diceNode)
                    
                    let randomX = Float((arc4random_uniform(4) + 1)) * (Float.pi/2)
                    //        let randomY = Double((arc4random_uniform(10) + 11)) * (Double.pi/2)
                    let randomZ = Float((arc4random_uniform(4) + 1)) * (Float.pi/2)
                    
                    diceNode.runAction(SCNAction.rotateBy(x: CGFloat(randomX * 5), y: 0, z: CGFloat(randomZ * 5), duration: 0.5))
                }
            } // loop
            }
            
            ///////////////////////////////////////////////////////////
            if let hitResult = results.first {
                // if addOldDice == false {
                if addOldDice == true {
                let diceScene = SCNScene(named: "art.scnassets/diceCollada.scn")!
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
                    
        //  diceLocation.name = textField.text! // add nov-12
                    print(">>>>>>>>>> plane textField.text = ", textField.text!)
                    print(">>>>>>>>>> plane diceLocation.name = ", diceLocation.name)
                    self.save(diceLocation: diceLocation)
                    sceneView.scene.rootNode.addChildNode(diceNode)
                    
                    //================================
                    // var textField = UITextField()
                    let alert = UIAlertController(title: "Add New Thing", message: "", preferredStyle: .alert)
                    let action = UIAlertAction(title: "Add", style: .default) { (action) in
                        print("AlertACtion --------------- = ", self.textField.text!)
                    }
                    alert.addAction(action)
                    alert.addTextField { (field) in
                        self.textField = field
                        self.textField.placeholder = "Add a new thing"
                    }
                    present(alert, animated: true, completion: nil)
                    //,,,,,,,,,,,,,,,,,,,,,,,,,,,
                    
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

//class PopupCls {
//
//    override func popup(completion: (_ popupResult: result) ) {
//        var textField = UITextField()
//
//        let result = textField // nov-15
//
//        let alert = UIAlertController(title: "Add New Thing", message: "", preferredStyle: .alert)
//
//        let action = UIAlertAction(title: "Add", style: .default) { (action) in print("AlertACtion")
//
//            alert.addAction(action)
//
//            alert.addTextField { (field) in
//                textField = field
//                textField.placeholder = "Add a new thing"
//                result = field // nov-15
//            }
//            present(alert, animated: true, completion: nil)
//
//        }
//
// }
