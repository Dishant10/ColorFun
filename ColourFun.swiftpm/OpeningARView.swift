//
//  OpeningARView.swift
//  ColourFun
//
//  Created by Dishant Nagpal on 08/04/23.
//

import SwiftUI

@available(iOS 16.0, *)
struct OpeningARView: View {
    
    @State var showingAlert = false
    @State private var showLandscapeAlert = false
    
    @EnvironmentObject private var selectedTab : Tabs
    
    //@Environment(\.orientation) var orientation
    
    var body: some View {
        ARView(showingAlert: $showingAlert)
            .ignoresSafeArea()
            .alert("Correct", isPresented: $showingAlert) {
                Button{
                    showingAlert = false
                }label:{
                    Text("Back")
                }
                Button{
                    selectedTab.selected = Tab.chromesthesia
                }label:{
                    Text("Next")
                }
                
            }message: {
                Text("You did this one too! You're now ready to move to the next and the final section of this app.\nCode : CRX")
            }
            .alert("Please Hold your device in landscape mode!",isPresented:$showLandscapeAlert){
            }
            .onAppear {
                showLandscapeAlert = true
            }
    }
    
}

@available(iOS 16.0, *)
struct OpeningARView_Previews: PreviewProvider {
    static var previews: some View {
        OpeningARView()
    }
}
