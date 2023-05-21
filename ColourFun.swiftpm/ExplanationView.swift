//
//  ExplanationView.swift
//  ColourFun
//
//  Created by Dishant Nagpal on 17/04/23.
//

import SwiftUI

@available(iOS 16.0, *)
struct ExplanationView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var showEndAlert = false
    
    @EnvironmentObject private var selectedTab : Tabs
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("Read for insights.") //optional view for users who want to know more about the equipments used.
                    .font(.largeTitle)
                    .bold()
                    .padding()
                    .padding(.top)
                Spacer()
                Text("As explained in the earlier slide, people having chromesthesia may see flasing colours or colours filled shapes. \n\nSome people might see a particular colour, where some people may see a combination of about 20 odd colours.\nSo it totally depends, depends on the person. \n\nThe purpose of using a xylophone and an animating circular ball was to depict the scenario of what a person having chromesthesia would feel if he/she played a xylophone. \n\nThere are the different notes in xylophone and usually people assign different colours to differnt notes and usually it appears like the colours are flashing towards them hence a animating ball that moves close to them while playing a note.")
                    .font(.system(size: 22, weight: .medium, design: .monospaced))
                    .minimumScaleFactor(0.4)
                    .padding([.leading,.trailing,.bottom])
                    .padding([.leading,.trailing])
                    .padding(.bottom)
                Spacer()
            }
            .padding()
            .navigationTitle("Explanation")
            .toolbar{
                Button{
                    // dismiss()
                    showEndAlert = true
                }label: {
                    Text("Done")
                        .padding(.trailing)
                }
            }
            .alert("End!", isPresented: $showEndAlert) {
                
            }message: {
                Text("Thank you for patiently using my project.")
            }
        }
    }
}

@available(iOS 16.0, *)
struct ExplanationView_Previews: PreviewProvider {
    static var previews: some View {
        ExplanationView()
    }
}
