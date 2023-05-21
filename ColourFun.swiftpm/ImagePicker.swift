//
//  ImagePicker.swift
//  ColourFun
//
//  Created by Dishant Nagpal on 02/04/23.
//

import SwiftUI
import PhotosUI

@available(iOS 16.0, *)
@MainActor
class ImagePicker : ObservableObject {
    
    @Published var image : Image?
    @Published var selectedImage : PhotosPickerItem? {
        didSet {
            if let selectedImage {
                Task {
                    try await loadTransferable(from: selectedImage)
                }
            }
        }
    }
    
    func loadTransferable(from selectedImage : PhotosPickerItem?) async throws {
        do {
            if let data = try await selectedImage?.loadTransferable(type: Data.self) {
                if let uiImage = UIImage(data: data){
                    self.image = Image(uiImage: uiImage)
                }
            }
        }
        catch {
            print(error.localizedDescription)
            image = nil
        }
    }
}
