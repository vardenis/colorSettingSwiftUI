//
//  ColorSliderView.swift
//  colorSetting
//
//  Created by Денис on 17.06.2022.
//

import SwiftUI

struct ColorSliderView: View {
    @Binding var value: Double
    @State private var valueText = "200"
    let color: Color
        
    var body: some View {
        HStack {
            ValueTextView(value: value, color: color)
            Slider(value: $value,
                   in: 0...255,
                   step: 1)
                .accentColor(color)
                .onChange(of: value) { newValue in
                    valueText = "\(lround(value))"
                }
            ValueTextFieldView(valueText: $valueText, value: $value)
        }
        .onAppear {
            valueText = "\(lround(value))"
        }
    }
    
}

struct ValueTextView: View {
    let value: Double
    let color: Color
    
    var body: some View {
        Text("\(lround(value))")
            .bold()
            .foregroundColor(color)
            .frame(width: 50, alignment: .leading)
    }
}

struct ValueTextFieldView: View {
    @Binding var valueText: String
    @Binding var value: Double
    
    var body: some View {
        TextField("0", text: $valueText)
            .frame(width: 60)
            .multilineTextAlignment(.trailing)
            .textFieldStyle(.roundedBorder)
            .keyboardType(.numberPad)
            .onChange(of: valueText) { newValue in
                checkValueText()
            }
    }
    
    private func checkValueText() {
        if let value = Double(valueText) {
            if value >= 0 && value <= 255 {
                self.value = Double(value)}
            else {
                self.value = 0
                valueText = "0"
            }
            return
        }
        value = 0
        valueText = "0"
    }
}

struct ColorSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSliderView(value: .constant(250), color: .red)
    }
}


