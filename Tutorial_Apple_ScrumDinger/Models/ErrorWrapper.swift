//
//  ErrorWrapper.swift
//  Tutorial_Apple_ScrumDinger
//
//  Created by Sedat Onat on 20.10.2022.
//

import Foundation

struct ErrorWrapper: Identifiable {
    let id: UUID
    let error: Error
    let guidance: String
    
    init (
        id: UUID = UUID(),
        error: Error,
        guidance: String
    )
    
    {
        self.id = id
        self.error = error
        self.guidance = guidance
    }
    
}
