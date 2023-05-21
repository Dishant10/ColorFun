//
//  ColorBoxView.swift
//  ColourFun
//
//  Created by Dishant Nagpal on 02/04/23.
//

import SwiftUI

@available(iOS 16.0, *)
struct ColorBoxView: View {
    
    @State private var gridInstructionSheetShowing = false //state variables
    @State private var valueRed = 5.0
    @State private var valueGreen = 5.0
    @State private var valueBlue = 5.0
    @State var rectangleBoxColor : Color?
    @State private var boxForegroundColor1 : Color = .white
    @State private var boxForegroundColor2 : Color = .white
    @State private var boxForegroundColor3 : Color = .white
    @State private var boxForegroundColor4 : Color = .white
    @State private var boxForegroundColor5 : Color = .white
    @State private var boxForegroundColor6 : Color = .white
    @State private var boxForegroundColor7 : Color = .white
    @State private var boxForegroundColor8 : Color = .white
    @State private var boxForegroundColor9 : Color = .white
    
    fileprivate let ansColor : Color = Color(red:193.0/255,green: 202.0/255,blue: 100.0/255) //answer Colour to match the user painted colour
    
    @State var correctAnswer = false
    
    @EnvironmentObject private var selectedTab : Tabs //environment object to switch tabs
    
    var body: some View {
        NavigationStack{
            VStack{
                Grid(horizontalSpacing: 1,verticalSpacing:0){ // Grid View
                    GridRow{
                        
                        RectangleColorBox(boxForegroundColor: $boxForegroundColor1)
                            .onTapGesture {
                                
                                rectangleBoxColor = Color(red: valueRed/255, green: valueGreen/255, blue: valueBlue/255)
                                boxForegroundColor1=rectangleBoxColor ?? .white
                            }
                            .contextMenu{
                                Text("Not me!")
                            }
                            .shadow(radius: 1)
                        
                        RectangleColorBox(boxForegroundColor: $boxForegroundColor2)
                            .onTapGesture {
                                rectangleBoxColor = Color(red: valueRed/255, green: valueGreen/255, blue: valueBlue/255)
                                boxForegroundColor2 = rectangleBoxColor ?? .black
                            }
                            .contextMenu{
                                Text("Not me!")
                            }
                            .shadow(radius: 1)
                        RectangleColorBox(boxForegroundColor: $boxForegroundColor3)
                            .onTapGesture {
                                rectangleBoxColor = Color(red: valueRed/255, green: valueGreen/255, blue: valueBlue/255)
                                boxForegroundColor3 = rectangleBoxColor ?? .teal
                            }
                            .contextMenu{
                                Text("Not me!")
                                
                            }
                            .shadow(radius: 1)
                        
                    }
                    GridRow{
                        
                        RectangleColorBox(boxForegroundColor: $boxForegroundColor4)
                            .onTapGesture {
                                rectangleBoxColor = Color(red: valueRed/255, green: valueGreen/255, blue: valueBlue/255)
                                boxForegroundColor4 = rectangleBoxColor ?? .white
                            }
                            .contextMenu{
                                Text("Not me!")                            }
                            .shadow(radius: 1)
                        RectangleColorBox(boxForegroundColor: $boxForegroundColor5)
                            .onTapGesture {
                                rectangleBoxColor = Color(red: valueRed/255, green: valueGreen/255, blue: valueBlue/255)
                                boxForegroundColor5 = rectangleBoxColor ?? .white
                            }
                            .contextMenu{
                                Text("Not me!")
                            }
                            .shadow(radius: 1)
                        RectangleColorBox(boxForegroundColor: $boxForegroundColor6)
                            .onTapGesture {
                                rectangleBoxColor = Color(red: valueRed/255, green: valueGreen/255, blue: valueBlue/255)
                                boxForegroundColor6 = rectangleBoxColor ?? .white
                            }
                            .contextMenu{
                                Text("Not me!")                            }
                            .shadow(radius: 1)
                        
                    }
                    GridRow{
                        
                        RectangleColorBox(boxForegroundColor: $boxForegroundColor7)
                            .onTapGesture {
                                let valueRedInt = Int(valueRed)
                                let valueRedDouble = Double(valueRedInt)
                                let valueGreenInt = Int(valueGreen)
                                let valueGreenDouble = Double(valueGreenInt)
                                let valueBlueInt = Int(valueBlue)
                                let valueBlueDouble = Double(valueBlueInt)
                                rectangleBoxColor = Color(red: valueRedDouble/255.0, green: valueGreenDouble/255.0, blue: valueBlueDouble/255.0)
                                if rectangleBoxColor == ansColor{
                                    correctAnswer = true
                                }
                                else {
                                    correctAnswer = false
                                }
                                boxForegroundColor7=rectangleBoxColor ?? .white
                                if boxForegroundColor7 == ansColor {
                                    correctAnswer = true
                                }
                                else {
                                    correctAnswer = false
                                }
                            }
                            .contextMenu{
                                Text("(193, 202, 100)")
                                
                                
                            }
                            .shadow(radius: 1)
                        RectangleColorBox(boxForegroundColor: $boxForegroundColor8)
                            .onTapGesture {
                                rectangleBoxColor = Color(red: valueRed/255, green: valueGreen/255, blue: valueBlue/255)
                                boxForegroundColor8 = rectangleBoxColor ?? .white
                            }
                            .contextMenu{
                                Text("Not me!")
                            }
                            .shadow(radius: 1)
                        RectangleColorBox(boxForegroundColor: $boxForegroundColor9)
                            .onTapGesture {
                                rectangleBoxColor = Color(red: valueRed/255, green: valueGreen/255, blue: valueBlue/255)
                                boxForegroundColor9 = rectangleBoxColor ?? .white
                            }
                            .contextMenu{
                                Text("Not me!")
                            }
                            .shadow(radius: 1)
                    }
                }
                .padding(.top)
                .padding([.leading,.trailing])
                
                
                //Sliders to adjust the Colour based on Red, Green and Blue values in real time.
                VStack(alignment: .leading){
                    Text("Red")
                    HStack{
                        Slider(value: $valueRed,in: 0...255)
                            .tint(.red)
                        Text("\(Int(valueRed))")
                    }
                    Text("Green")
                    HStack{
                        Slider(value: $valueGreen,in: 0...255)
                            .tint(.green)
                        Text("\(Int(valueGreen))")
                    }
                    Text("Blue")
                    HStack{
                        Slider(value: $valueBlue,in: 0...255)
                            .tint(.blue)
                        Text("\(Int(valueBlue))")
                    }
                    HStack(alignment: .center){
                        Spacer()
                        RoundedRectangle(cornerRadius: 20) // Rectangular view to see the colour made using RGB values
                            .frame(maxWidth: 250,maxHeight:75)
                            .foregroundColor(Color(red:  valueRed/255, green: valueGreen/255, blue: valueBlue/255))
                            .shadow(color: .white, radius: 2)
                            .padding()
                        Spacer()
                    }
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
            .alert("Correct Answer!", isPresented: $correctAnswer) { //alert if the user painted corrected.
                Button{
                    selectedTab.selected = Tab.grid
                }label:{
                    Text("Back")
                }
                Button{
                    selectedTab.selected = Tab.match
                }label:{
                    Text("Next")
                }
            }message: {
                Text("\nGreat job! You figured that out and I hope you had fun making your own colours. So let's hop on to the next task.\n\nCode : AXR")
            }
        }
    }
}

@available(iOS 16.0, *)
struct ColorBoxView_Previews: PreviewProvider {
    static var previews: some View {
        ColorBoxView()
    }
}
