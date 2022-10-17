//
//  ScrumStore.swift
//  Tutorial_Apple_ScrumDinger
//
//  Created by Sedat Onat on 17.10.2022.
//

import Foundation
import SwiftUI

class ScrumStore: ObservableObject {
    @Published var scrum: [DailyScrum]=[]
    
    // User 'in verecegi lokasyona dosyayi kayit edecek
    private static func fileURL() throws -> URL { // verilen adresi URL 'e ceviriyor #learn
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("scrum.data")
        
    }
    
    
}
