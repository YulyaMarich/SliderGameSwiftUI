//
//  ControlButton.swift
//  SliderGameSwiftUI
//
//  Created by Julia on 11.03.2022.
//

import SwiftUI

struct ControlButton: View {
    var title: String
    var action: () -> Void
    var body: some View {
        
        Button(action: action) {
            Text(title)
        }
    }
}

struct ControlButton_Previews: PreviewProvider {
    static var previews: some View {
        ControlButton(title: "Press me!", action: {})
    }
}
