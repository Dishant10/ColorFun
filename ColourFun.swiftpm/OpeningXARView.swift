//
//  OpeningXARView.swift
//  ColourFun
//
//  Created by Dishant Nagpal on 16/04/23.
//

import SwiftUI

struct OpeningXARView: View {
    @ObservedObject var xcoordinator = XCoordinator()
    //  @State var xcoordinator.tappedNode1E = false
    //@State var showText = self.xcoordinator.tappedNode1E
    @State var showText = false
    
    var body: some View {
        VStack{
            xcoordinator.ColorView
            XylophoneARView(showText:$showText)
                .onTapGesture {
                    showText.toggle()
                }
        }
    }
}

struct OpeningXARView_Previews: PreviewProvider {
    static var previews: some View {
        OpeningXARView()
    }
}
