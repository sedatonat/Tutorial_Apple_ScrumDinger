//
//  History.swift
//  Tutorial_Apple_ScrumDinger
//
//  Created by Sedat Onat on 17.10.2022.
//

import Foundation  // Neden SwiftUI degil? #learn

struct History: Identifiable, Codable {
    let id: UUID // Primary key
    let date: Date // Formati nereden giriyoruz acaba?
    var attendees: [DailyScrum.Attendee] // Varolan listeden alacak
    var lengthInMinutes: Int // Burasina sanki 5 dakikalik setler versek daha guzel olurdu. Ama sonradan deneyecegim #learn
    var transcript: String?
    
    init(
        // Bu kisimda default format ve value 'lar tanimlaniyor
        id: UUID = UUID(),
        date: Date = Date(),
        attendees: [DailyScrum.Attendee],
        lengthInMinutes: Int = 5,
        transcript: String? = nil   
    ) {
        self.id = id
        self.date = date
        self.attendees = attendees
        self.lengthInMinutes = lengthInMinutes
        self.transcript = transcript
    }
    
    
    
}
