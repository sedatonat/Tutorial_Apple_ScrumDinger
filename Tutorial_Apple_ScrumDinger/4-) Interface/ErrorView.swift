//
//  ErrorView.swift
//  Tutorial_Apple_ScrumDinger
//
//  Created by Sedat Onat on 20.10.2022.
//

import SwiftUI

struct ErrorView: View {
    let errorWrapper: ErrorWrapper
    @Environment(\.dismiss) private var dismiss // Tutorial Note: "With the @Environment property wrapper, you can read a value that the view’s environment stores, such as the view’s presentation mode, scene phase, visibility, or color scheme. In this case, you access the view’s dismiss structure and call it like a function to dismiss the view." #learn
    
    
    
    
    var body: some View {
        NavigationView {
            VStack {
                Text("An error has occured!")
                    .font(.title)
                    .padding(.bottom)
                Text(errorWrapper.error.localizedDescription)
                    .font(.headline)
                Text(errorWrapper.guidance)
                    .font(.caption)
                    .padding(.top)
                Spacer()
            }
            .padding()
            .background(.ultraThinMaterial) // Blurring the background
            .cornerRadius(16)
            .navigationBarTitleDisplayMode(.inline) // Kaldirinca birsey degismedi #learn
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Dismiss") {
                        dismiss()
                    }
                }
            } // Dismiss butonu
            
            
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    enum SampleError: Error {
        case errorRequired
    }
    
    static var wrapper: ErrorWrapper {
        ErrorWrapper(error: SampleError.errorRequired,
                     guidance: "You can safely ignore this error")
    }
    
    
    static var previews: some View {
        ErrorView(errorWrapper: wrapper)
    }
}
