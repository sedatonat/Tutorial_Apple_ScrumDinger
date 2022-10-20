//
//  ErrorView.swift
//  Tutorial_Apple_ScrumDinger
//
//  Created by Sedat Onat on 20.10.2022.
//

import SwiftUI

struct ErrorView: View {
    let errorWrapper: ErrorWrapper
    
    
    var body: some View {
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
