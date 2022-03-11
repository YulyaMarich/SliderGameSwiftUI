//
//  UISlider.swift
//  SliderGameSwiftUI
//
//  Created by Julia on 11.03.2022.
//

import SwiftUI

struct CustomUISlider: UIViewRepresentable {
    @Binding var sliderValue: Double
    var opacity: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider(frame: .zero)
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.tintColor = .gray
        
        slider.addTarget(context.coordinator,
                         action: #selector(Coordinator.valueSetted), for: .valueChanged)
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.thumbTintColor = .purple.withAlphaComponent(CGFloat(opacity)/100)
        uiView.value = Float(sliderValue)
    }
    
    func makeCoordinator() -> CustomUISlider.Coordinator {
        Coordinator(value: $sliderValue)
    }
}

extension CustomUISlider {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        @objc func valueSetted(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct CustomUISlider_Previews: PreviewProvider {
    static var previews: some View {
        CustomUISlider(sliderValue: .constant(20), opacity: 0.9)
    }
}
