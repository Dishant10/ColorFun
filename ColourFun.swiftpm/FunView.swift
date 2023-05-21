//
//  FunView.swift
//  ColourFun
//
//  Created by Dishant Nagpal on 02/04/23.
//

import SwiftUI

@available(iOS 16.0, *)
struct FunView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var checkCodeAlert = false
    @State private var codeInput = ""
    @State private var wrongAnswerAlert = false
    @State private var finalAlert = false
    @State private var blurText = true
    
    fileprivate let codeAnswer = "AXR" // Answer code String
    
    @EnvironmentObject private var selectedTab : Tabs
    
    var body: some View {
        NavigationStack {
            ZStack {
                if colorScheme == .dark {
                    LinearGradient(colors: [.green.opacity(0.3),.white,.green.opacity(0.3)], startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea()
                }
                else {
                    LinearGradient(colors: [.green.opacity(0.49),.white,.green.opacity(0.49)], startPoint: .top, endPoint: .bottom)
                        .ignoresSafeArea()
                    
                }
                VStack{
                    ZStack{
                        GeometryReader { geo in
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundColor(.white.opacity(0.63))
                            VStack{
                                VStack(alignment:.leading,spacing:20){
                                    Text("Congratulations on completing the previous task and successfully finding out the secret code to this mission.This section is about hexcodes and will have a quiz in augmented reality.")
                                    HStack(alignment:.top,spacing: 10){
                                        Text("•")
                                        Text("This section is about hexcodes and completing this will lead to the last section of the app! The next screen will have a quiz in augmented reality.")
                                    }
                                    HStack(alignment:.top,spacing: 10){
                                        Text("•")
                                        Text("On the top of the screen, you will see a hexcode, a secret code that holds the key to a particular color. Your task is to use your newly acquired skills to find the correct color out of three options given below. Each option will have its RGB values written at the bottom.")
                                    }
                                    Text("You will have to use your color sense and your new-found knowledge to match the correct color with the hexcode. **Click** the rightly coloured box and the code will appear on your screen.")
                                    Text("\nIf you're up for the challenge, give it a try! But if you're not sure about hexcodes and how to calculate them, don't worry, just click the button below to learn more")
                                    
                                }
                                .foregroundColor(colorScheme  == .dark ? .black : .black)
                                .font(.system(size: 23, weight: .medium, design: .monospaced))
                                .minimumScaleFactor(0.4)
                                .padding()
                                .padding([.leading,.trailing])
                                NavigationLink{
                                    OpeningView4()
                                }label: {
                                    Text("Learn HexCodes!")
                                        .foregroundColor(colorScheme == .dark ? .blue.opacity(1.5) : .blue)
                                        .padding()
                                }
                                Spacer()
                                VStack{
                                    HStack{
                                        Spacer()
                                        NavigationLink{
                                            OpeningARView()
                                                .ignoresSafeArea()
                                        }  label: {
                                            Image(systemName: "arrowshape.forward.fill")
                                                .padding()
                                                .background(.blue)
                                                .foregroundColor(.white)
                                                .clipShape(Circle())
                                                .frame(maxWidth: 55,maxHeight:45)
                                                .padding(.bottom)
                                        }
                                    }
                                    .padding(.trailing)
                                }
                            }
                        }
                        .ignoresSafeArea(.keyboard) // put view behind the keyboard instead of views moving up
                        .blur(radius: blurText == true ? 3 : 0)
                    }
                    .padding()
                    .padding([.leading,.trailing])
                    .padding([.leading,.trailing])
                    .ignoresSafeArea(.keyboard)
                }
                .ignoresSafeArea(.keyboard)
            }
            .navigationTitle("Match in AR")
            .alert("Mission 2", isPresented: $checkCodeAlert) { //first alert
                TextField("Code", text: $codeInput)
                Button{
                    selectedTab.selected = Tab.grid
                }label:{
                    Text("Cancel")
                }
                Button("OK", action: submit)
            } message: {
                Text("Please enter the code to continue further.")
            }
            .alert("Mission 2", isPresented: $wrongAnswerAlert) { // second
                TextField("Code", text: $codeInput)
                Button {
                    selectedTab.selected = Tab.grid
                }label:{
                    Text("Go to Grid Section")
                }
                Button("OK", action: submitWrongCode)
            } message: {
                Text("You have entered the wrong code. Please try again. If you don't have the correct code you try the grid section again to get the desired code for this section.")
                    .foregroundColor(.red)
            }
            .alert("Mission 2", isPresented: $finalAlert){ //third
                Button{
                    selectedTab.selected = Tab.grid
                }label:{
                    Text("Go Back")
                }
            } message: {
                Text("Seems you are struggling with the code for this section. Please go to the grid section and try to find the code again.\nThank you!!!")
            }
            .onAppear{
                checkCodeAlert = true
                withAnimation {
                    blurText = true
                }
                
                
            }
        }
    }
    func submit() {
        wrongAnswerAlert = false
        if codeInput == codeAnswer {
            HapticManager.instance.notification(type: .success)
            wrongAnswerAlert = false
            checkCodeAlert = false
            codeInput = ""
            withAnimation {
                blurText = false
            }
            
        }
        else {
            codeInput = ""
            HapticManager.instance.notification(type: .error)
            wrongAnswerAlert = true
        }
    }
    func submitWrongCode(){
        wrongAnswerAlert = false
        if codeInput == codeAnswer{
            HapticManager.instance.notification(type: .success)
            wrongAnswerAlert=false
            codeInput = ""
            withAnimation {
                blurText = false
            }
        }
        else {
            //  wrongAnswerAlert = true
            HapticManager.instance.notification(type: .error)
            codeInput = ""
            finalAlert = true
        }
        
    }
}

struct FunView_Previews: PreviewProvider {
    
    static var previews: some View {
        if #available(iOS 16.0, *) {
            FunView()
        } else {
            // Fallback on earlier versions
        }
    }
}
