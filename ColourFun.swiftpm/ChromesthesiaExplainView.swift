//
//  SynesthesiaExplainView.swift
//  ColourFun
//
//  Created by Dishant Nagpal on 11/04/23.
//

import SwiftUI

@available(iOS 16.0, *)
struct ChromesthesiaExplainView: View {
    
    @Environment(\.colorScheme) var colorScheme // to determine the colorscheme of the device used
    
    @State private var checkCodeAlertC = false //state variables
    @State private var blurTextC = false
    @State private var codeInputC = ""
    @State private var wrongAnswerAlertC = false
    @State private var finalAlertC = false
    
    fileprivate let codeAnswerC = "CRX" // answer key hardcoded
    
    @EnvironmentObject private var selectedTab : Tabs //environment object to switch tabs based on selction
    
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(colors: [.blue.opacity(0.6),.white,.blue.opacity(0.4)], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.white.opacity(0.8))
                        VStack{
                            VStack(alignment:.leading,spacing:20){
                                Text("\nColours are fascinating right? \n\nBut some people percieve colours different than us. Have you ever heard of Chromesthesia?")
                                HStack(alignment:.top,spacing: 10){
                                    Text("•")
                                    Text("It's a unique condition where people experience sound as colors. Imagine hearing a song and seeing a vibrant rainbow of colors at the same time! ")
                                }
                                HStack(alignment:.top,spacing: 10){
                                    Text("•")
                                    Text("People with Chromesthesia can see colors in various shapes and sizes, and they often associate them with certain sounds or musical notes.")
                                }
                                HStack(alignment:.top,spacing: 10){
                                    Text("•")
                                    Text("Unfortunately, people with Chromesthesia are often misunderstood and thought to be weird.\nThey're not weird or different just special in their own way.")
                                }
                                
                                Text("Tap the next button to experience what a person having chromesthesia would feel if they ever listen or play a Xylophone. \n\nIllustrations are used to make the concept of chromesthesia more visual and understable.")
                                
                            }
                            .foregroundColor(colorScheme == .dark ? .black : .black)
                            .font(.system(size: 24, weight: .medium, design: .monospaced))
                            .minimumScaleFactor(0.4)
                            .padding([.leading,.trailing])
                            Spacer()
                            VStack{
                                HStack{
                                    Spacer()
                                    NavigationLink{
                                        XylophoneView()
                                    }  label: {
                                        Image(systemName: "arrowshape.forward.fill")
                                            .padding()
                                            .background(.blue)
                                            .foregroundColor(.white)
                                            .clipShape(Circle())
                                            .frame(maxWidth: 75,maxHeight:55)
                                            .padding()
                                    }
                                }
                            }
                        }
                        .ignoresSafeArea(.keyboard) // views does not respect the keyboard and always stays behind it
                        .blur(radius: blurTextC == true ? 3 : 0) //blur until the user enters the correct code
                    }
                }
                .padding([.leading,.trailing])
                .padding()
                .ignoresSafeArea(.keyboard)
            }
            .navigationTitle("Chromesthesia")
            .alert("Welcome to the last section of the app", isPresented: $checkCodeAlertC) { //first alert
                TextField("Code", text: $codeInputC)
                Button{
                    selectedTab.selected = Tab.match
                }label:{
                    Text("Back")
                }
                Button("OK", action: submitC)
                
            } message: {
                Text("Please enter the code to continue further.")
            }
            .alert("Mission 3", isPresented: $wrongAnswerAlertC) { // second alert to try again
                TextField("Code", text: $codeInputC)
                Button{
                    selectedTab.selected = Tab.match
                }label:{
                    Text("Back")
                }
                Button("OK", action: submitWrongCodeC)
                
            } message: {
                Text("You have entered the wrong code. Please try again. If you don't have the correct code you try the match in AR section again to get the desired code for this section.")
                    .foregroundColor(.red)
            }
            .alert("Mission 3", isPresented: $finalAlertC){ //third alert to try the previous section again.
                Button{
                    selectedTab.selected = Tab.match
                }label:{
                    Text("AR Section")
                }
            } message: {
                Text("Seems you are struggling with the code for this section. Please go to the match in AR section and try to find the code again.\nThank you!!!")
            }
            .onAppear{
                checkCodeAlertC = true
                withAnimation {
                    blurTextC = true
                }
            }
        }
    }
    func submitC() {
        wrongAnswerAlertC = false
        if codeInputC == codeAnswerC {
            HapticManager.instance.notification(type: .success)
            wrongAnswerAlertC = false
            checkCodeAlertC = false
            codeInputC = ""
            withAnimation {
                blurTextC = false
            }
            selectedTab.selected = Tab.chromesthesia
        }
        else {
            codeInputC = ""
            HapticManager.instance.notification(type: .error)
            wrongAnswerAlertC = true
        }
    }
    func submitWrongCodeC(){
        wrongAnswerAlertC = false
        if codeInputC == codeAnswerC{
            HapticManager.instance.notification(type: .success)
            wrongAnswerAlertC=false
            codeInputC = ""
            withAnimation {
                blurTextC = false
            }
        }
        else {
            //  wrongAnswerAlert = true
            HapticManager.instance.notification(type: .error)
            codeInputC = ""
            finalAlertC = true
        }
        
    }
}

@available(iOS 16.0, *)
struct ChromesthesiaExplainView_Previews: PreviewProvider {
    static var previews: some View {
        ChromesthesiaExplainView()
    }
}
