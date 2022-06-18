//
//  ContentView.swift
//  colorSetting
//
//  Created by Денис on 17.06.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var colorRed = Double.random(in: 0...255)
    @State private var colorGreen = Double.random(in: 0...255)
    @State private var colorBlue = Double.random(in: 0...255)
    @FocusState private var focusedField: Field?
    
    var body: some View {
        NavigationView {
                VStack {
                    ColorWindowView(colorRed: colorRed, colorGreen: colorGreen, colorBlue: colorBlue)
                    ColorSliderView(value: $colorRed, color: .red)
                        .focused($focusedField, equals: .red)
                    ColorSliderView(value: $colorGreen, color: .green)
                        .focused($focusedField, equals: .green)
                    ColorSliderView(value: $colorBlue, color: .blue)
                        .focused($focusedField, equals: .blue)
                    Spacer()
                }
                .padding()
                .hiddenNavigationBarStyle()
        }
        .onTapGesture {
            let keyWindow = UIApplication.shared.connectedScenes
                .filter({$0.activationState == .foregroundActive})
                .map({$0 as? UIWindowScene})
                .compactMap({$0})
                .first?.windows
                .filter({$0.isKeyWindow}).first
            keyWindow!.endEditing(true)
        }
       .toolbar {
            ToolbarItem(placement: .keyboard) {
                Button("Done"){
                    focusedField = nil
                }
            }
        }
    }
}

extension ContentView {
    enum Field {
        case red
        case green
        case blue
    }
}
struct HiddenNavigationBar: ViewModifier {
    func body(content: Content) -> some View {
        content
        .navigationBarTitle("", displayMode: .inline)
        .navigationBarHidden(true)
    }
}

extension View {
    func hiddenNavigationBarStyle() -> some View {
        modifier( HiddenNavigationBar() )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


