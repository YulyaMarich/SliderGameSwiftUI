//
//  ContentView.swift
//  SliderGameSwiftUI
//
//  Created by Julia on 11.03.2022.
//

import SwiftUI

struct ContentView: View {
    @State var currentValue = 0.0
    @State var targetValue = Int.random(in: 0...99)
    @State var showScore = false
    
    var body: some View {
        VStack {
            Text("Turn slider to \(targetValue) as close as possible")
            HStack {
                Text("0")
                CustomUISlider(sliderValue: $currentValue, opacity: Double(computeScore()))
                Text("100")
            }
            .padding(.horizontal)
            ControlButton(title: "Check result", action: {showScore = true})
                .alert(isPresented: $showScore) {
                    Alert(title: Text("Your score:"), message: Text("\(computeScore())")
                )}
                .padding()
            ControlButton(title: "Start over", action: {targetValue = Int.random(in: 0...99)})
        }
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
