//
//  AirPodsMax3DRotation.swift
//  iOS16Animations
//

import SwiftUI

struct AirPodsMax3DRotation: View {
    
    // 1. Add a state variable for the "from" and "to" animation values
    @State private var is3DYRotating = 360.0
    
    var body: some View {
        ZStack {
            
            Image("swiftUITut")
                .resizable()
                .opacity(0.5)
                .blur(radius: 1)
            
            VStack {
                Spacer()
                VStack(spacing: 24) {
                    VStack {
                        HStack {
                            Spacer()
                            Image(systemName: "xmark")
                        }
                        
                        Text("Amos' AirPods Max")
                            .font(.title)
                    }
                    
                    Image("airpodsMax")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 178, height: 232)
                    // 3. Animate the Y-coordinate
                        .rotation3DEffect(
                            .degrees(
                                is3DYRotating * 2),
                                axis: (
                                    x: 0,
                                    y: is3DYRotating,
                                    z: 0))
                    // 4. Add the animation and easing
                        .animation(.easeOut(duration: 6).repeatForever(autoreverses: false), value: is3DYRotating)
                    // 2. Trigger the animation
                        .onAppear {
                            is3DYRotating = .random(in: 1...80)
                        }
                    
                    VStack(spacing: 8) {
                        Image(systemName: "battery.75")
                            .symbolRenderingMode(.hierarchical)
                            .foregroundColor(.green)
                            .font(.title)
                        
                        Text("75 %")
                    }
                }
                .padding()
                .background(.white)
                .cornerRadius(32)
                .frame(width: UIScreen.main.bounds.width - 12)
            }
        }
        .ignoresSafeArea()
    }
}

struct AirPodsMax3DRotation_Previews: PreviewProvider {
    static var previews: some View {
        AirPodsMax3DRotation()
    }
}
