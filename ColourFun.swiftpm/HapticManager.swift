//
//  HapticManager.swift
//  ColourFun
//
//  Created by Dishant Nagpal on 08/04/23.
//

import Foundation
import SwiftUI

class HapticManager { //hapticmanager class to handle haptic feedback
    static let instance = HapticManager() //singleton
    
    func notification(type:UINotificationFeedbackGenerator.FeedbackType){ // to offer different types of feedback based on successful or unsuccessfull entries
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
}
