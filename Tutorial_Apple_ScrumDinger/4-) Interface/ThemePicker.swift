//
//  ThemePicker.swift
//  Tutorial_Apple_ScrumDinger
//
//  Created by Sedat Onat on 13.10.2022.
//

import SwiftUI

struct ThemePicker: View {
    @Binding var selection: Theme
    
    
    var body: some View {
        Picker("Theme", selection: $selection) {
            ForEach(Theme.allCases) {theme in
                ThemeView(theme: theme)
                    .tag(theme) // #learn
            }
        }
    }
}

struct ThemePicker_Previews: PreviewProvider {
    static var previews: some View {
        ThemePicker(selection: .constant(.periwinkle))
    }
}
