//
//  PlaySound.swift
//  ColourFun
//
//  Created by Dishant Nagpal on 17/04/23.
//

import Foundation
import SwiftUI
import AVKit
import AVFoundation

class PlaySound:ObservableObject{ // class to handle xylophone audio playback
    @Published var audioPlayer: AVAudioPlayer! // audioPlayer variable which announces itself if changed or played.
    
    func playNote(soundName:String){
            HapticManager.instance.notification(type: .success) // give haptic feedback of type success
            if let url = Bundle.main.url(forResource: soundName, withExtension: "wav"){ // get the url of the sound file
                do {
                    self.audioPlayer = try AVAudioPlayer(contentsOf: url)
                    self.audioPlayer?.prepareToPlay()
                    self.audioPlayer?.play()
                }catch {
                    print("Error : \(error.localizedDescription)")
                }
            }
            else{
                print("Error path not found.")
            }
        }
}
