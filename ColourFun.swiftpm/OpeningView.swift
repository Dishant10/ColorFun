//
//  OpeningView.swift
//  ColourFun
//
//  Created by Dishant Nagpal on 02/04/23.
//

import SwiftUI

@available(iOS 16.0, *)
struct OpeningView: View {
    @Environment(\.colorScheme) var colorScheme
    
    @State private var backgroundViewColor : Color = .red.opacity(0.3)
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.red.opacity(0.3)
                    .ignoresSafeArea()
                VStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.white.opacity(0.3))
                        VStack{
                            VStack(alignment:.leading,spacing: 20){
                                Text("I am Dishant, I am a student and a budding iOS developer.\n\nMy project is about colors and chromesthesia. My aim to build this project is to empower other developers to learn more about digital colours and to spread awarness about chromesthesia.\n\nThis project is designed to have four section and three tasks. Use the buttons on the bottom to move forward in the project.")
                                HStack(alignment:.top,spacing: 10){
                                    Text("•")
                                    Text("The **first** intro section is about the things that will be used to do the task in each section, navigate till the end in this section.")
                                }
                                HStack(alignment:.top,spacing: 10){
                                    Text("•")
                                    Text("The **second** section is the Grid section where user has to do their first task.")
                                }
                                HStack(alignment:.top,spacing: 10){
                                    Text("•")
                                    Text("The **third** section to match the hexcode in AR. This section will test your skills.")
                                }
                                
                                HStack(alignment:.top,spacing: 10){
                                    Text("•")
                                    Text("The **fourth** and ultimate section is to feel and know more about chromesthesia.")
                                }
                                Text("Click on the next button to learn the concepts used in the project.")
                                
                            }
                            .font(.system(size: 23, weight: .medium, design: .monospaced))
                            .minimumScaleFactor(0.4)
                            .padding()
                            .padding([.leading,.trailing])
                            Spacer()
                            VStack{
                                HStack{
                                    Spacer()
                                    NavigationLink{
                                        OpeningView2()
                                    }  label: {
                                        VStack{
                                            Image(systemName: "arrowshape.forward.fill")
                                                .padding()
                                                .background(.blue)
                                                .foregroundColor(.white)
                                                .clipShape(Circle())
                                                .frame(maxWidth: 55,maxHeight:45)
                                                .padding(.bottom)
                                        }
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
            .navigationTitle("Hey, Apple!")
        }
    }
}


@available(iOS 16.0, *)
struct OpeningView_Previews: PreviewProvider {
    static var previews: some View {
        OpeningView()
    }
}
