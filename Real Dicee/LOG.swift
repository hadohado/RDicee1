//
//  LOG.swift
//  RDicee33
//
//  Created by ha tuong do on 11/16/19.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import Foundation


//where Realm db located for Dice Loc  Optional(file:///var/mobile/Containers/Data/Application/4E0D7514-BAAB-4636-9D2F-431805675F92/Documents/default.realm)
//2019-11-16 13:12:56.646672-0800 RDicee333[917:99474] Metal GPU Frame Capture Enabled
//2019-11-16 13:12:56.647848-0800 RDicee333[917:99474] Metal API Validation Enabled
//number of dice in Realm database =  5
//2019-11-16 13:12:56.810574-0800 RDicee333[917:99474] [general] NSSecureCoding allowed classes list contains [NSObject class], which bypasses security by allowing any Objective-C class to be implicitly decoded. Consider reducing the scope of allowed classes during decoding by listing only the classes you expect to decode, or a more specific base class than NSObject.
// !!!!!!!!! mycount =  5
//--> i =  1
// i =  1  -------- x OLD =  Optional(0.5)  y =  Optional(0.0)  z =  Optional(-0.7)
//--> i =  2
//something strange here i =  2
//--> i =  3
//something strange here i =  3
//--> i =  4
//something strange here i =  4
//--------x LAMP =  Optional(0.2)  y  =  Optional(0.0)  z  =  Optional(-0.5)
//2019-11-16 13:12:57.888543-0800 RDicee333[917:99764] [Technique] World tracking performance is being affected by resource constraints [1]
//2019-11-16 13:12:57.888673-0800 RDicee333[917:99764] [Technique] VIO error callback: 8983.383948, 1, Frame processing rate has fallen below pre-set threshold
//2019-11-16 13:12:57.987314-0800 RDicee333[917:99764] [Technique] VIO error callback: 8983.484009, 1, Frame processing rate has fallen below pre-set threshold
//2019-11-16 13:12:58.086966-0800 RDicee333[917:99764] [Technique] VIO error callback: 8983.584069, 1, Frame processing rate has fallen below pre-set threshold
//plane detected
//touchy ! =  <UITouch: 0x1540f9220> phase: Began tap count: 1 force: 0.000 window: <UIWindow: 0x151d751c0; frame = (0 0; 320 568); gestureRecognizers = <NSArray: 0x2835056b0>; layer = <UIWindowLayer: 0x283b5d0a0>> view: <ARSCNView: 0x151e31aa0 | session=0x151d8dbe0 scene=<SCNScene: 0x280e758c0> sceneTime=0.000000 frame={{0, 0}, {320, 568}} pointOfView=<SCNNode: 0x280775200 pos(-0.039928 0.007317 -0.004419) rot(-0.958107 0.286150 -0.012220 0.529753) scale(1.000000 1.000000 1.000000) | camera=<SCNCamera: 0x151e0d890> | no child>> location in window: {101, 326} previous location in window: {101, 326} location in view: {101, 326} previous location in view: {101, 326}
//touch.location =  (101.0, 326.0)
//>>>>>>>>>> feature point diceLocation.name =
//>>>>>>>>>> feature point diceLocation.name =  fake-0.16126074
//>>>>>>>>>> plane textField.text =
//>>>>>>>>>> plane diceLocation.name =  xyz
//2019-11-16 13:13:03.752687-0800 RDicee333[917:99726] [SceneKit] Error: Failed to load <C3DImage 0x28156e100 src:file:/Users/ai87/Desktop/In%20The%20MOMENT/CLASS-ios-angela-latest/app/RDicee2/Real%20Dicee/art.scnassets/Normal.jpg [0.000000x0.000000]>
//2019-11-16 13:13:03.991368-0800 RDicee333[917:99764] [Technique] World tracking performance is being affected by resource constraints [1]
//2019-11-16 13:13:03.991469-0800 RDicee333[917:99764] [Technique] VIO error callback: 8989.420938, 1, Frame processing rate has fallen below pre-set threshold
//2019-11-16 13:13:04.046225-0800 RDicee333[917:99764] [Technique] VIO error callback: 8989.537675, 1, Frame processing rate has fallen below pre-set threshold
//2019-11-16 13:13:04.165198-0800 RDicee333[917:99764] [Technique] VIO error callback: 8989.637736, 1, Frame processing rate has fallen below pre-set threshold
//2019-11-16 13:13:04.362255-0800 RDicee333[917:99474] Warning: Attempt to present <UIAlertController: 0x15222a600>  on <RDicee333.ViewController: 0x151e10fb0> which is already presenting (null)
//2019-11-16 13:13:04.374446-0800 RDicee333[917:99764] [Technique] VIO error callback: 8989.854534, 1, Frame processing rate has fallen below pre-set threshold
//2019-11-16 13:13:04.460136-0800 RDicee333[917:99764] [Technique] VIO error callback: 8989.954594, 1, Frame processing rate has fallen below pre-set threshold
//2019-11-16 13:13:04.560226-0800 RDicee333[917:99764] [Technique] VIO error callback: 8990.054655, 1, Frame processing rate has fallen below pre-set threshold
//2019-11-16 13:13:04.661404-0800 RDicee333[917:99764] [Technique] VIO error callback: 8990.154715, 1, Frame processing rate has fallen below pre-set threshold
//AlertACtion --------------- =
//touchy ! =  <UITouch: 0x151e4aae0> phase: Began tap count: 1 force: 0.000 window: <UIWindow: 0x151d751c0; frame = (0 0; 320 568); autoresize = W+H; gestureRecognizers = <NSArray: 0x2835056b0>; layer = <UIWindowLayer: 0x283b5d0a0>> view: <ARSCNView: 0x151e31aa0 | session=0x151d8dbe0 scene=<SCNScene: 0x280e758c0> sceneTime=0.000000 frame={{0, 0}, {320, 568}} pointOfView=<SCNNode: 0x280775200 pos(0.371590 0.166019 -0.128255) rot(-0.191436 -0.971576 -0.139263 0.448917) scale(1.000000 1.000000 1.000000) | camera=<SCNCamera: 0x151e0d890> | no child>> location in window: {178, 159.5} previous location in window: {178, 159.5} location in view: {178, 159.5} previous location in view: {178, 159.5}
//touch.location =  (178.0, 159.5)
//2019-11-16 13:13:18.752767-0800 RDicee333[917:99474] *** Terminating app due to uncaught exception 'RLMException', reason: 'Attempting to modify object outside of a write transaction - call beginWriteTransaction on an RLMRealm instance first.'
//*** First throw call stack:
//(0x18529898c 0x184fc10a4 0x104ebb874 0x104ebf8c0 0x104ebf894 0x104ebf818 0x104563f7c 0x104566f2c 0x1892d2b64 0x1892d2a08 0x1991bb094 0x1892e0af0 0x1892e20a8 0x1892beae8 0x1ba2b1fa8 0x18933623c 0x189338798 0x18933160c 0x1852167e0 0x185216738 0x185215ed0 0x18521101c 0x1852108bc 0x18f07c328 0x1892a66d4 0x104571298 0x18509b460)
//libc++abi.dylib: terminating with uncaught exception of type NSException
