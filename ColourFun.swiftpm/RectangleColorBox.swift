//
//  RectangleColorBox.swift
//  ColourFun
//
//  Created by Dishant Nagpal on 02/04/23.
//

import SwiftUI

struct RectangleColorBox: View {
    
    @Binding var boxForegroundColor : Color //binding to the grid boxes's foreground colour
    @State private var foregroundColorRectangle : Color = .white
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(boxForegroundColor)
            .shadow(radius: 3)
            .padding()
//            .contextMenu{
//                Text("Box")
//            }
//            .onTapGesture {
//                foregroundColorRectangle = rectangleBoxColor
//            }
        
    }
}

//struct RectangleColorBox_Previews: PreviewProvider {
//    static var previews: some View {
//        RectangleColorBox(rectangleBoxColor: Color.white)
//    }
//}
