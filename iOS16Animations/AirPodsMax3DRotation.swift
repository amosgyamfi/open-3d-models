//
//  AirPodsMax3DRotation.swift
//  iOS16Animations
//
//  Created by amos.gyamfi@getstream.io on 8.10.2022.
//

import SwiftUI

struct AirPodsMax3DRotation: View {
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
                        .rotation3DEffect(
                            .degrees(
                                is3DYRotating * 2),
                                axis: (
                                    x: 0,
                                    y: is3DYRotating,
                                    z: 0))
                        .animation(.easeOut(duration: 6).repeatForever(autoreverses: false), value: is3DYRotating)
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
