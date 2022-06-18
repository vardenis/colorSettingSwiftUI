//
//  ColorWindowView.swift
//  colorSetting
//
//  Created by Денис on 17.06.2022.
//

import SwiftUI

struct ColorWindowView: View {
    let colorRed: Double
    let colorGreen: Double
    let colorBlue: Double
    
    var body: some View {
        Color(
              red: colorRed/255,
              green: colorGreen/255,
              blue: colorBlue/255
             )
            .frame(height: 150)
            .cornerRadius(10)
    }
}

struct ColorWindowView_Previews: PreviewProvider {
    static var previews: some View {
        ColorWindowView(colorRed: 130, colorGreen: 130, colorBlue: 130)
    }
}
