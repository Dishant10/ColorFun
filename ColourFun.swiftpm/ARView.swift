//
//  NewARView.swift
//  ColourFun
//
//  Created by Dishant Nagpal on 07/04/23.
//

import SwiftUI
import ARKit
import SceneKit

struct ARView: UIViewRepresentable {
    
    @Binding var showingAlert : Bool //Binding to trigger alert if the user chooses the correct option
    
    var hexCodeString = " # 4 1 4 B 5 A " //hardcoded hexcode question string
    
    func makeUIView(context: Context) -> some UIView { //sceneView
        let sceneView = ARSCNView() //creates a AR Scene View
        let configuration = ARWorldTrackingConfiguration() //aware of the camera surroundings
        sceneView.session.run(configuration)
        
        let hexCodeText = SCNText(string: hexCodeString, extrusionDepth: 0.05) //Creates AR text
        hexCodeText.font = UIFont.systemFont(ofSize: 0.7)
        hexCodeText.firstMaterial?.diffuse.contents = UIColor.red
        let hexCodeNode = SCNNode(geometry: hexCodeText)
        hexCodeNode.position = SCNVector3(x: -0.2, y: 0.075, z: -0.80)
        hexCodeNode.scale=SCNVector3(0.15, 0.15, 0.15)
        sceneView.scene.rootNode.addChildNode(hexCodeNode)
        
        let blockWidth: CGFloat = 0.23
        let blockHeight: CGFloat = 0.23
        let colors: [UIColor] = [UIColor(red: 0.29, green: 0.0, blue: 0.6, alpha: 1.0), UIColor(red: 0.78, green: 0.45, blue: 0.37, alpha: 1.0), UIColor(red: 0.25, green: 0.29, blue: 0.33, alpha: 1.0)]
        let rgbCodes: [String] = ["( 7 4 , 0 , 1 5 3 ) ", " ( 1 9 9 , 1 1 5 , 9 6 )   ", "    ( 6 5, 7 5, 9 0 )"]
        
        for (index, color) in colors.enumerated() { // creates AR coloured blocks as options
            let blockGeometry = SCNBox(
                width: blockWidth,
                height: blockHeight,
                length: 0.12,
                chamferRadius: 0.01
            )
            blockGeometry.firstMaterial?.diffuse.contents = color
            let blockNode = SCNNode(geometry: blockGeometry)
            blockNode.position = SCNVector3(
                Float(index - 1) * (Float(blockWidth) + 0.232)+0.14,
                0.04,
                -0.80
            )
            blockNode.name = "\(index+1)"
            sceneView.scene.rootNode.addChildNode(blockNode)
            
            let nameText = SCNText(string: rgbCodes[index], extrusionDepth: 0.05)
            nameText.font = UIFont.systemFont(ofSize: 0.048)
            nameText.firstMaterial?.diffuse.contents = UIColor.white
            let nameNode = SCNNode(geometry: nameText)
            nameNode.position = SCNVector3(
                Float(index - 1) * (Float(blockWidth) + 0.22)-0.037,-1.28,-0.80)
            // nameNode.scale=SCNVector3(0.8, 0.8, 0.8)
            sceneView.scene.rootNode.addChildNode(nameNode)
        }
        
        
        sceneView.autoenablesDefaultLighting = true // adds lighting to the scene
        
        sceneView.automaticallyUpdatesLighting = true // updates the lighting for the scene automatically
        
        let tapGesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.handleTap(_:)))
        
        sceneView.addGestureRecognizer(tapGesture) // adds touch gesture recognition capability to the scene
        
        return sceneView //returns the AR Scene View
    }
    
    
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(showingAlert: $showingAlert) //coordinator to handle taps
    }
}

@MainActor
class Coordinator: NSObject, UIGestureRecognizerDelegate,ObservableObject { //class coordinator to handle taps outside of the Struct view
    
    @Binding var showingAlert : Bool //binding to update the alert if the user touched on the right block
    
    init(showingAlert: Binding<Bool>) { // initializer for the binding
        _showingAlert = showingAlert
    }
    
    @objc func handleTap(_ sender: UITapGestureRecognizer) { //handle tap func
        let sceneView = sender.view as! ARSCNView // to handle taps on which view
        let touchLocation = sender.location(in: sceneView) // to get the touch location
        // Perform hit testing on the AR scene
        if let node = sceneView.hitTest(touchLocation, options: nil).first?.node { // which node touched if touched that is if hitTest is not empty becuase it is an array of locations
            //print("Tapped on node: \(node.name ?? "Unnamed Node")")
            if node.name == "3" {
                showingAlert = true // updating the alert if 3 node is tapped
                HapticManager.instance.notification(type: .success) // give haptic feedback
                return
            }
            else if node.name == "1" || node.name == "2"{ // else condition
                HapticManager.instance.notification(type: .error) // error feedback
            }
        }
    }

    func Node3(binding:Binding<Bool>){
        
        binding.wrappedValue = true
    }
}
