//
//  OpeningView2.swift
//  ColourFun
//
//  Created by Dishant Nagpal on 09/04/23.
//

import SwiftUI

@available(iOS 16.0, *)
struct OpeningView2: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.green.opacity(0.33)
                    .ignoresSafeArea()
                VStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 20)
                            .foregroundColor(.white.opacity(0.48))
                        VStack{
                            VStack(alignment:.leading,spacing:20){
                                Text("Colors play a vital role in our lives, and their significance goes beyond just aesthetics.")
                                HStack(alignment:.top,spacing: 10){
                                    Text("•")
                                    Text("In digital spaces like phones, TVs, and computer screens, colors are made using the RGB color model. This model is based on the way human eyes perceive color, as cones in our eyes are most sensitive to red, green, and blue light.")
                                }
                                HStack(alignment:.top,spacing: 10){
                                    Text("•")
                                    Text("To experience this color variation, you can visit the grid section of the app and adjust the intensity of red, green, and blue colors. By combining these primary colors in different intensities, a wide range of colors can be created that closely mimics natural colors.")
                                }
                                
                                HStack(alignment:.top,spacing: 10){
                                    Text("•")
                                    Text("This color model has become the standard in digital devices due to its ability to produce a vast range of colors. Additionally, the RGB color model can also be used to calculate hex codes for colors, which are commonly used in software development and design.")
                                }
                                Text("\n\nClick the next button to find out more about hexcodes. The next section is the last that you have to learn about I promise.")
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
                                        OpeningView4()
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
                .navigationTitle("Colours")
            }
        }
    }
}

@available(iOS 16.0, *)
struct OpeningView2_Previews: PreviewProvider {
    static var previews: some View {
        OpeningView2()
    }
}
