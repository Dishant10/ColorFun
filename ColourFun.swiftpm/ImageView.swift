//
//  ImageView.swift
//  ColourFun
//
//  Created by Dishant Nagpal on 02/04/23.
//

import SwiftUI
import PhotosUI

@available(iOS 16.0, *)
struct ImageView: View { //Will be used to depict changes in a image by manipulating RGB scale of an image
    @State private var isShowingImageInstructions = false
    @State private var image : Image?
    @State private var showingImagePicker = false
    
    @ObservedObject var imagePicker = ImagePicker()
    
    var body: some View {
        NavigationStack{
            VStack {
                PhotosPicker(selection:$imagePicker.selectedImage,matching:.images){
                    ZStack{
                        Rectangle()
                            .fill(.gray)
                            //.cornerRadius(10)
                            //.padding([.leading,.trailing],20)
                        Text("Tap me to select a picture!")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                    .overlay {
                            imagePicker.image?
                                .resizable()
                                .scaledToFit()

//                                .aspectRatio(contentMode: .fit)
                    }
                    .padding([.leading,.trailing])
                    .contextMenu{
                        Button {
                            if imagePicker.image != nil{
                                imagePicker.image = nil
                            }
                        }label: {
                            if imagePicker.image != nil{
                                Text("Remove Image")
                            }else {
                               Text("Select an image!")
                            }
                        }
                    }
                }
            }
            .navigationTitle("Filter")
            .toolbar {
                ToolbarItemGroup{
                    
                    Button {
                        isShowingImageInstructions = true
                    }label: {
                        Text("Instructions")
                    }
                }
                                
            }
            .sheet(isPresented: $isShowingImageInstructions) {
                //ImageInstructionView()
            }
        }
    }
    
    struct ImageView_Previews: PreviewProvider {
        static var previews: some View {
            ImageView()
        }
    }
}
