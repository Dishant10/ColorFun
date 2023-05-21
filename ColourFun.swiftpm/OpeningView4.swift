//
//  OpeningView4.swift
//  ColourFun
//
//  Created by Dishant Nagpal on 10/04/23.
//

import SwiftUI

@available(iOS 16.0, *)
struct OpeningView4: View {
    
    @State private var isSelected = 1
    @State private var exerciseSheetShowing = false
    
    @EnvironmentObject private var selectedTab : Tabs
    
    let hexaDecimal = ["0","1","2","3","4","5","6","7","8","9","A(10)","B(11)","C(12)","D(13)","E(14)","F(15)"] //hexaDecimal String
    let decimal = ["0","1","2","3","4","5","6","7","8","9"] // Decimal String
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.blue.opacity(0.3)
                    .ignoresSafeArea()
                VStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.white.opacity(0.43))
                        VStack{
                            ScrollView(showsIndicators: true){
                                Text("Hex codes are a way to represent colors in the digital world using a six-character combination of numbers and letters. They make it easier to remember and work with colors in various digital applications.Hex codes use a number system known as hexadecimal, where values from 0 to 15 are represented using a combination of letters and numbers, which is distinct from the decimal system. See the difference below.")
                                    .font(.system(size: 23, weight: .medium, design: .monospaced))
                                    .minimumScaleFactor(0.4)
                                    .padding()
                                //.padding([.leading,.trailing])
                                Picker("Picker", selection: $isSelected) { // To pick between Decimal and HexaDecimal examples
                                    Text("Decimal").tag(1)
                                    Text("Hexadecimal").tag(2)
                                }.padding()
                                    .pickerStyle(.segmented)
                                HStack{
                                    Group {
                                        if isSelected == 1{
                                            ForEach(decimal,id:\.self) { number in
                                                Text(number)
                                                    .font(.system(size: 25))
                                            }
                                        }
                                        else if isSelected == 2{
                                            VStack{
                                                HStack{ // Done becuase of contraints (fix required)
                                                    Text(hexaDecimal[0])
                                                    Text(hexaDecimal[1])
                                                    Text(hexaDecimal[2])
                                                    Text(hexaDecimal[3])
                                                    Text(hexaDecimal[4])
                                                    Text(hexaDecimal[5])
                                                    Text(hexaDecimal[6])
                                                    Text(hexaDecimal[7])
                                                    Text(hexaDecimal[8])
                                                    Text(hexaDecimal[9])
                                                }
                                                .font(.system(size:25))
                                                .padding(.bottom,2)
                                                HStack{
                                                    Text(hexaDecimal[10])
                                                    Text(hexaDecimal[11])
                                                    Text(hexaDecimal[12])
                                                    Text(hexaDecimal[13])
                                                    Text(hexaDecimal[14])
                                                    Text(hexaDecimal[15])
                                                }
                                                .font(.system(size:25))
                                            }
                                        }
                                    }
                                }
                                // .padding()
                                HStack{
                                    Text("#")
                                        .font(.title)
                                    VStack(spacing:0){
                                        Text("9e")
                                            .font(.title)
                                        Color.red
                                            .frame(width:29,height:3)
                                    }
                                    VStack(spacing:0){
                                        Text("51")
                                            .font(.title)
                                        Color.green
                                            .frame(width:39,height:3)
                                    }
                                    VStack(spacing:0){
                                        Text("7f")
                                            .font(.title)
                                        Color.blue
                                            .frame(width:29,height:3)
                                    }
                                }
                                .font(.system(size: 25))
                                .padding()
                                Text("Hexcodes are divided into three pairs representing the Red, Green, and Blue values of a color. The hexadecimal numbering system consists of 16s and 1s, represented by numbers and letters. For example, #FF0000 represents pure red, where FF is the highest value of Red and the other values are 0. Similarly, #00FF00 represents pure green, and #0000FF represents pure blue.")
                                    .font(.system(size: 23, weight: .medium, design: .monospaced))
                                    .minimumScaleFactor(0.4)
                                    .padding()
                                VStack{
                                    HStack{
                                        VStack(spacing:0){
                                            Text("9e")
                                                .font(.title)
                                            Color.red
                                                .frame(width:39,height:3)
                                        }
                                        Text("= 9 x 16 + E x 1 = 158")
                                            .font(.title)
                                    }
                                    HStack{
                                        VStack(spacing:0){
                                            Text("51")
                                                .font(.title)
                                            Color.green
                                                .frame(width:39,height:3)
                                        }
                                        Text("= 5 x 16 + 1 x 1 = 81")
                                            .font(.title)
                                    }
                                    HStack{
                                        VStack(spacing:0){
                                            Text("7f")
                                                .font(.title)
                                            Color.blue
                                                .frame(width:39,height:3)
                                        }
                                        Text("= 7 x 16 + F x 1 = 127")
                                            .font(.title)
                                    }
                                    Text("The RGB values for the given hexcode is (158,81,127).")
                                        .font(.system(size: 23, weight: .medium, design: .monospaced))
                                        .font(.system(size: 25))
                                        .minimumScaleFactor(0.5)
                                }
                                .font(.system(size: 25))
                                .scrollIndicators(.visible)
                            }
                            Spacer()
                            VStack{
                                HStack{
                                    Spacer()
                                    Button{
                                        withAnimation(.easeInOut(duration:2)){
                                            selectedTab.selected = Tab.grid
                                        }
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
                                .padding([.leading,.trailing])   
                            }
                        }
                    }
                    .padding()
                    .padding([.leading,.trailing])
                    .padding([.leading,.trailing])
                }
            }
            .navigationTitle("HexCodes")
        }
    }
}

@available(iOS 16.0, *)
struct OpeningView4_Previews: PreviewProvider {
    static var previews: some View {
        OpeningView4()
    }
}
