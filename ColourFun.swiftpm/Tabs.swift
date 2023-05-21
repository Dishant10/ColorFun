//
//  Tabs.swift
//  ColourFun
//
//  Created by Dishant Nagpal on 18/04/23.
//

import Foundation
import SwiftUI

class Tabs:ObservableObject { // ObservableObject class to handle switching of tabs in the apps.
    @Published var selected : Tab = .intro // Publish if the selection changes
    
    init(initialSelection : Tab = .intro){
        self.selected = initialSelection
    }
}


enum Tab { // tab type enum
    case intro,grid,match,chromesthesia
}
