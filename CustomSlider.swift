//
//  CustomSlider.swift
//  PhotoGallery
//
//  Created by Arslan Ilyas on 14/07/2024.
//

import SwiftUI
import UIKit

struct CustomSlider: UIViewRepresentable {
    @Binding var value: Double

    class Coordinator: NSObject {
        var customSlider: CustomSlider
        
        init(customSlider: CustomSlider) {
            self.customSlider = customSlider
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            customSlider.value = Double(sender.value)
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(customSlider: self)
    }
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = Float(value)
        
        
        // Customizing the slider thumb image
        if let thumbImage = UIImage(named: "thumbImage") {
            slider.setThumbImage(thumbImage, for: .normal)
        }
        
        slider.minimumTrackTintColor = .purple
        slider.maximumTrackTintColor = .green
        
        slider.addTarget(context.coordinator, action: #selector(Coordinator.valueChanged(_:)), for: .valueChanged)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
    }
}
// Example SwiftUI view using CustomSlider
struct TempView: View {
    @State private var sliderValue: Double = 50.0

    var body: some View {
        VStack {
            CustomSlider(value: $sliderValue)
                .frame(height: 50)
            Text("Slider value: \(sliderValue)")
        }
        .padding()
    }
}

struct TempView_Previews: PreviewProvider {
    static var previews: some View {
       TempView()
    }
}
