//
//  XCoordinator.swift
//  ColourFun
//
//  Created by Dishant Nagpal on 15/04/23.
//

import Foundation
import SwiftUI
import ARKit
import SceneKit

@MainActor
class XCoordinator: NSObject, UIGestureRecognizerDelegate,ObservableObject {
    
    @Published var ColorView : Color = .red
    var shouldUpdateView: Bool = true

    // @State var tappedNode1 : Bool = false
//    @Binding var tappedNode2 : Bool
//    @Binding var tappedNode3 : Bool
//    @Binding var tappedNode4 : Bool
//    @Binding var tappedNode5 : Bool
//    @Binding var tappedNode6 : Bool
//    @Binding var tappedNode7 : Bool
    
//    init(tappedNode1:Binding<Bool>,tappedNode2:Binding<Bool>,tappedNode3:Binding<Bool>,tappedNode4:Binding<Bool>,tappedNode5:Binding<Bool>,tappedNode6:Binding<Bool>,tappedNode7:Binding<Bool>){
//        _tappedNode1 = tappedNode1
//        _tappedNode2 = tappedNode2
//        _tappedNode3 = tappedNode3
//        _tappedNode4 = tappedNode4
//        _tappedNode5 = tappedNode5
//        _tappedNode6 = tappedNode6
//        _tappedNode7 = tappedNode7
//
//    }
//    init(tappedNode1: Binding<Bool>) {
//        _tappedNode1 = tappedNode1
//    }
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        let sceneView = sender.view as! ARSCNView
        let touchLocation = sender.location(in: sceneView)
        // Perform hit testing on the AR scene
        if let node = sceneView.hitTest(touchLocation, options: nil).first?.node {
            // Node was tapped
            //print("Tapped on node: \(node.name ?? "Unnamed Node")")
            if node.name == "1" {
                //tappedNode1 = true
             //   tappedNode1E = true
                objectWillChange.send()
                ColorView = .green
                print("I am in node 1")
                HapticManager.instance.notification(type: .success)
                //return
                //return
            }
//            else if node.name == "2"{
//                HapticManager.instance.notification(type: .success)
//                tappedNode2=true
//               // return
//            }
//            else if node.name == "3"{
//                HapticManager.instance.notification(type: .success)
//                tappedNode3=true
//                //return
//            }
//            else if node.name == "4"{
//                HapticManager.instance.notification(type: .success)
//                tappedNode4=true
//                //return
//            }
//            else if node.name == "5"{
//                HapticManager.instance.notification(type: .success)
//                tappedNode5=true
//                    //return
//            }
//            else if node.name == "6"{
//                HapticManager.instance.notification(type: .success)
//                tappedNode6=true
//              //  return
//            }
//            else if node.name == "7"{
//                HapticManager.instance.notification(type: .success)
//                tappedNode7=true
//               // return
//            }
        }
    }
}
