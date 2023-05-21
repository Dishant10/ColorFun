//
//  XylphoneARView.swift
//  ColourFun
//
//  Created by Dishant Nagpal on 15/04/23.
//

import Foundation
import SwiftUI
import ARKit
import SceneKit


//struct NewView:View {
//    @StateObject var xCoordinator = XCoordinator()
//    var body: some View{
//        VStack{
//            XylophoneARView(tappedNode1: $xCoordinator.tappedNode1E)
//        }
//    }
//}

struct XylophoneARView: UIViewRepresentable {
    
    
    @Binding var showText : Bool
    // @Binding var tappedNode1 : Bool
    //@ObservedObject var xCoordinator = XCoordinator()
    
    func makeUIView(context: Context) -> some UIView {
        let sceneView = ARSCNView()
        let configuration = ARWorldTrackingConfiguration()
        sceneView.session.run(configuration)
        
        let colors: [UIColor] = [UIColor.purple, UIColor.blue, UIColor.systemIndigo,UIColor.green,UIColor.yellow,UIColor.orange,UIColor.red]
        
        var blockWidth: CGFloat = 0.24
        var blockHeight: CGFloat = 0.18
        
        for (index, color) in colors.enumerated() {
            if index != 0 {
                blockWidth = blockWidth + 0.12
            }
            if index == 0 {
                blockHeight = 0.12
            }
            let blockGeometry = SCNBox(
                width: blockWidth,
                height: blockHeight,
                length: 0.001,
                chamferRadius: 0.007
            )
            blockGeometry.firstMaterial?.diffuse.contents = color
            let blockNode = SCNNode(geometry: blockGeometry)
            blockNode.position = SCNVector3(
                -0.1,
                 index == 0 ? -0.2 : Float(index-1)/6,
                 -2.0
            )
            blockNode.name = "\(index+1)"
            sceneView.scene.rootNode.addChildNode(blockNode)
            
        }
        
        let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.handleTap(_:)))
        
        sceneView.addGestureRecognizer(tapGesture)
        
        if showText == true {
            print("Tapped on Node 1")
        }
        
        sceneView.automaticallyUpdatesLighting = true
        sceneView.autoenablesDefaultLighting = true
        
        return sceneView
    }
    
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    func makeCoordinator() -> XCoordinator {
        XCoordinator()
    }
}


