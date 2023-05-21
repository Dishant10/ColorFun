//
//  XylophoneView.swift
//  ColourFun
//
//  Created by Dishant Nagpal on 16/04/23.
//

import SwiftUI
import AVKit
import AVFoundation

@available(iOS 16.0, *)
struct XylophoneView: View {
    
    @State private var animate = true
    @State var animateCircle = false
    @State private var circleColour1 = Color.cyan
    @State private var circleColour2 = Color.green
    @State private var animate2 = false
    @State private var showExplainationSheet = false
    
    @ObservedObject var playSound = PlaySound() // playsound object to play whenever xylophone is played
    
    var body: some View {
        NavigationStack{
            GeometryReader { geo in // geometryReader to adjust with of xylophone keys
                ZStack{
                    Color.orange.opacity(0.2)
                        .hueRotation(Angle(degrees: animate ? 180 : 10))
                        .animation(.easeInOut(duration: 0.95), value: animate)
                        .blur(radius: 10)
                        .ignoresSafeArea()
                    VStack(spacing:80){
                        VStack{
                            ZStack(alignment:.topLeading){
                                RoundedRectangle(cornerRadius: 15)
                                    .foregroundColor(.red)
                                    .frame(maxWidth: geo.size.width*0.89,maxHeight:80) // first key
                                    .onTapGesture {
                                        withAnimation(.linear(duration: 0.2)){
                                            circleColour1 = .blue // update color in the circle view
                                            circleColour2 = .red // update color in the circle view
                                        }
                                        withAnimation(.easeInOut(duration: 1)){ // start animation
                                            animateCircle.toggle()
                                        }
                                        withAnimation(.easeInOut(duration: 2)){ // stop animation
                                            animateCircle = false
                                        }
                                        playSound.playNote(soundName: "C") // playsound and pass Text as soundname parameter
                                        
                                    }
                                Text("C")
                                    .font(.system(size:20))
                                    .foregroundColor(.white)
                                    .bold()
                                    .padding([.leading,.top])
                            }
                            ZStack(alignment:.topLeading){
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.orange)
                                    .frame(maxWidth: (geo.size.width)*0.825,maxHeight:80)
                                    .onTapGesture {
                                        withAnimation(.linear(duration: 0.2)){
                                            circleColour1 = .mint
                                            circleColour2 = .white
                                        }
                                        withAnimation(.easeInOut(duration: 1)){
                                            animateCircle.toggle()
                                        }
                                        withAnimation(.easeInOut(duration: 2)){
                                            animateCircle = false
                                        }
                                        playSound.playNote(soundName: "D")
                                        
                                    }
                                Text("D")
                                    .font(.system(size:20))
                                    .foregroundColor(.white)
                                    .bold()
                                    .padding([.leading,.top])
                            }
                            ZStack(alignment:.topLeading){
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.yellow)
                                    .frame(maxWidth: geo.size.width*0.765,maxHeight:80)
                                    .onTapGesture {
                                        withAnimation(.linear(duration: 0.2)){
                                            circleColour1 = .gray
                                            circleColour2 = .orange
                                        }
                                        withAnimation(.easeInOut(duration: 1)){
                                            animateCircle.toggle()
                                        }
                                        withAnimation(.easeInOut(duration: 2)){
                                            animateCircle = false
                                        }
                                        playSound.playNote(soundName: "E")
                                        
                                    }
                                Text("E")
                                    .font(.system(size:20))
                                    .foregroundColor(.white)
                                    .bold()
                                    .padding([.leading,.top])
                            }
                            ZStack(alignment:.topLeading){
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.green)
                                    .frame(maxWidth: geo.size.width*0.705,maxHeight:80)
                                    .onTapGesture {
                                        withAnimation(.linear(duration: 0.2)){
                                            circleColour1 = .indigo
                                            circleColour2 = .red
                                        }
                                        withAnimation(.easeInOut(duration: 1)){
                                            animateCircle.toggle()
                                        }
                                        withAnimation(.easeInOut(duration: 2)){
                                            animateCircle = false
                                        }
                                        playSound.playNote(soundName: "F")
                                        
                                    }
                                Text("F")
                                    .font(.system(size:20))
                                    .foregroundColor(.white)
                                    .bold()
                                    .padding([.leading,.top])
                            }
                            ZStack(alignment:.topLeading){
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.indigo)
                                    .frame(maxWidth: geo.size.width*0.645,maxHeight:80)
                                    .onTapGesture {
                                        withAnimation(.linear(duration: 0.2)){
                                            circleColour1 = .cyan
                                            circleColour2 = .pink
                                        }
                                        withAnimation(.easeInOut(duration: 1)){
                                            animateCircle.toggle()
                                        }
                                        withAnimation(.easeInOut(duration: 2)){
                                            animateCircle = false
                                        }
                                        playSound.playNote(soundName: "G")
                                        
                                    }
                                Text("G")
                                    .font(.system(size:20))
                                    .foregroundColor(.white)
                                    .bold()
                                    .padding([.leading,.top])
                            }
                            ZStack(alignment:.topLeading){
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.blue)
                                    .frame(maxWidth: geo.size.width*0.570,maxHeight:80)
                                    .onTapGesture {
                                        withAnimation(.linear(duration: 0.2)){
                                            circleColour1 = .yellow
                                            circleColour2 = .white
                                        }
                                        withAnimation(.easeInOut(duration: 1)){
                                            animateCircle.toggle()
                                        }
                                        withAnimation(.easeInOut(duration: 2)){
                                            animateCircle = false
                                        }
                                        playSound.playNote(soundName: "A")
                                    }
                                Text("A")
                                    .font(.system(size:20))
                                    .foregroundColor(.white)
                                    .bold()
                                    .padding([.leading,.top])
                            }
                            ZStack(alignment:.topLeading){
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(.purple)
                                    .frame(maxWidth: geo.size.width*0.520,maxHeight:80)
                                    .onTapGesture {
                                        withAnimation(.linear(duration: 0.2)){
                                            circleColour1 = Color(red: 102/255, green: 188/255, blue: 80/255)
                                            circleColour2 = .white.opacity(0.4)
                                        }
                                        withAnimation(.easeInOut(duration: 1)){
                                            animateCircle = true
                                        }
                                        withAnimation(.easeInOut(duration: 2)){
                                            animateCircle = false
                                        }
                                        playSound.playNote(soundName: "B")
                                        
                                    }
                                Text("B")
                                    .font(.system(size:20))
                                    .foregroundColor(.white)
                                    .bold()
                                    .padding([.leading,.top])
                            }
                        }
                        .padding(.bottom)
                        .padding(.top)
                        Button {
                            withAnimation(.easeInOut(duration: 1)){ // stop scale effect if the view is tapped
                                animateCircle = false
                            }
                        }label:{
                            Circle()
                                .frame(maxWidth: 250,maxHeight:250)
                                .foregroundStyle(.linearGradient(colors: [circleColour1,circleColour2,.white], startPoint: .topTrailing, endPoint: .bottomLeading))
                                .scaleEffect(animateCircle ? 1.2 : 0.7)
                            // .rotation3DEffect(.degrees(30), axis: (x: 1, y: 0, z: 0))
                                .shadow(radius: 3)
                                .padding(.bottom)
                        }
                    }
                }
                .onTapGesture {
                }
                .onAppear{
                    withAnimation(.easeIn(duration: 2.0).repeatForever()){
                        animate.toggle()
                    }
                    animate2 = true
                }
                .onDisappear{
                    animate = false
                    animate2 = false
                }
                .toolbar{
                    Button{
                        showExplainationSheet = true
                    }label:{
                        Text("Explanation")
                            .padding(.bottom)
                    }
                }
                .sheet(isPresented: $showExplainationSheet, content: { // explanation view to explain why xylophone and an animating ball was used.
                    ExplanationView()
                })
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    
}

@available(iOS 16.0, *)
struct XylophoneView_Previews: PreviewProvider {
    static var previews: some View {
        XylophoneView()
    }
}
