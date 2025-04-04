//
//  ContentView.swift
//  ARKit_App
//
//  Created by Rania Arbash on 2025-04-04.
//

import SwiftUI
import ARKit


struct ARView : UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        
        let scneView = ARSCNView()
        scneView.showsStatistics = true
       
        let configuration = ARWorldTrackingConfiguration()

        let diceScene = SCNScene(named: "newone.scnassets/ship.scn")!
        
        let diceNode = diceScene.rootNode.childNode(withName: "shipMesh", recursively: true)
        
        
        scneView.scene.rootNode.addChildNode(diceNode!)

       // let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
//        let sphere = SCNSphere(radius: 0.2)
//        
//        let material = SCNMaterial()
//     //   material.diffuse.contents = UIColor.red
//        material.diffuse.contents = UIImage(named: "earth.jpg")
//       
//        sphere.materials = [material]
//        
//        
//        let node = SCNNode()
//        node.position = SCNVector3(x: 0, y: 0.1, z: -0.7)
//        
//        node.geometry = sphere
//        scneView.automaticallyUpdatesLighting = true

             
        scneView.session.run(configuration)
        
        return scneView
        
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
    
    
}
struct ContentView: View {
    var body: some View {
       ARView()
    }
}

#Preview {
    ContentView()
}
