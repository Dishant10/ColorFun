//
//  GridInstructionView.swift
//  ColourFun
//
//  Created by Dishant Nagpal on 02/04/23.
//

import SwiftUI

@available(iOS 16.0, *)
struct GridInstructionView: View {
    @State private var dummySliderValue : Double = 5.0  //slider value
    @Environment(\.colorScheme) var colorScheme //environment variable to dissmiss sheet
    @EnvironmentObject private var selectedTab : Tabs 
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(colors: [.red.opacity(0.6),.white.opacity(0.1),.red.opacity(0.6)], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                VStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.white.opacity(0.9))
                        VStack{
                            VStack(alignment:.leading){
                                Text("Congratulations on learning about colours and how are they made using Red, Green, Blue colours. There are a million possible combination of colours to make from just three main colours. \n\nNow let's put your skills to the test with a fun exercise. Imagine you are a detective on a mission to crack the code of the color world. ")
                                Text("Instructions : ")
                                    .font(.largeTitle)
                                    .bold()
                                    .frame(alignment: .leading)
                                    .padding(.top)
                                Text("\nIn this section you will be given a 3x3 grid. There would be 9 white coloured rectangular boxes, one and only one box in that grid will have the hint, you need to use that hint to paint that particular box. Long pressing the boxes will reveal which one it is. \n\n\nAfter you solve this challenge you will get a code on your screen that will be used in the next section.\n\n\nIf you're up for the challenge, give it a try!")
                            }
                                .foregroundColor(colorScheme == .dark ? .black : .black)
                                .font(.system(size: 23, weight: .medium, design: .monospaced))
                                .minimumScaleFactor(0.4)
                                .padding([.leading,.trailing])
                                .padding()
                            Spacer()
                            VStack{
                                
                                HStack{
                                    Spacer()
                                    NavigationLink{
                                        //                                            HapticManager.instance.notification(type: .success)
                                        ColorBoxView()
                                    }  label: {
                                        Image(systemName: "arrowshape.forward.fill")
                                            .padding()
                                            .background(.blue)
                                            .foregroundColor(.white)
                                            .clipShape(Circle())
                                            .frame(maxWidth: 75,maxHeight:55)
                                            .padding(.bottom)
                                    }
                                }
                                .padding(.trailing)
                                
                            }
                        }
                    }
                }
                .padding()
                .padding([.leading,.trailing])
                .padding([.leading,.trailing])
            }
            .navigationTitle("Paint Grid")
        }
    }
}

struct dummyRectangleBox:View { //non-tappable rounded rectangle box to show how the real cell in the view would look like
    var body:some View{
        RoundedRectangle(cornerRadius: 20)
            .frame(maxWidth: 130,maxHeight: 100)
            .foregroundColor(.white)
            .shadow(radius: 3)
    }
}

@available(iOS 16.0, *)
struct GridInstructionView_Previews: PreviewProvider {
    static var previews: some View {
        GridInstructionView()
    }
}
