import SwiftUI

@available(iOS 16.0, *)
struct ContentView: View {
//    @State public var tabState : String = "1"
    @StateObject private var tabs = Tabs(initialSelection: .intro) // Selection to switch between tabs seamlessly
    
    var body: some View {
        TabView(selection: $tabs.selected){  // Tab View
            
            OpeningView()
                .tabItem {
                    VStack{
                        Image(systemName: "star.fill")
                        Text("Intro")
                    }
                }
                .tag(Tab.intro)
            
            GridInstructionView()
                .tabItem {
                    VStack{
                        Image(systemName: "square.grid.3x3")
                        Text("Grid")
                    }
                }
                .tag(Tab.grid)
            
            FunView()
                .tabItem {
                    VStack{
                        Image(systemName: "square.stack.3d.down.right.fill")
                        Text("Match")
                    }
                }
                .tag(Tab.match)
            
            ChromesthesiaExplainView()
                .tabItem {
                    VStack{
                        Image(systemName: "heart.circle.fill")
                        Text("Chromesthesia")
                    }
                }
                .tag(Tab.chromesthesia)
        }
        .ignoresSafeArea()
        .environmentObject(tabs) // injected the tab object so every view can use it with Environment object
    }
}
