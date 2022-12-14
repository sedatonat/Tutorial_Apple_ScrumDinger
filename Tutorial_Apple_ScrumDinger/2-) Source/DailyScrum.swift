//
//  DailyScrum.swift
//  Tutorial_Apple_ScrumDinger
//
//  Created by Sedat Onat on 4.10.2022.
//

import SwiftUI

struct DailyScrum: Identifiable, Codable {
    let id: UUID // AutoNumber / Primary Key gibi
    var title: String // Elle yaziliyor
    var attendees: [Attendee] // Bir listeden seciliyor
    var lengthInMinutes: Int // Elle giriliyor
    var theme: Theme // Otomatik geliyor
    var history: [History] = [] // Bu neden boyle? #learn
    
    // Buradaki "=UUID()" eklentisi olmadan, extension hata veriyor. Bunun neden eklendiğini anlayamadım.#learn
    // Buradaki attendees neden halen String onu da anlamadim #learn
    init(id: UUID = UUID(), title: String, attendees: [String], lengthInMinutes: Int, theme: Theme) {
        self.id = id
        self.title = title
        self.attendees = attendees.map { Attendee(name: $0) }  // Burayi hic anlamadim. #learn
        self.lengthInMinutes = lengthInMinutes
        self.theme = theme
    }
}

// Bu primary key olarak mi dusunuluyor? #learn
extension DailyScrum {
    struct Attendee: Identifiable, Codable {
        let id: UUID
        var name: String
        
        // Bu kismi neden ekledik (veya neden yukariya eklemedik) hic anlamadim. #learn
        init (id: UUID = UUID(), name: String) {
            self.id = id
            self.name = name
        }
    }
    
    struct Data { // buraya neden Codable eklenmedi? #learnD
        var title: String = ""
        var attendees: [Attendee] = []
        var lengthInMinutes: Double = 5
        var theme: Theme = .seafoam
    }
    
    var data: Data {
        Data(title: title, attendees: attendees, lengthInMinutes: Double(lengthInMinutes), theme: theme)
    }
    
    // Bu kısım sanırım DetailView 'dan data 'yı alıp senkornize ediyor ama bakmak lazim #learn
    mutating func update(from data: Data) {
        title = data.title
        attendees = data.attendees
        lengthInMinutes = Int(data.lengthInMinutes)
        theme = data.theme
    }
    
    // Burasi olmadigi icin ScrumsView 'a data gelmiyordu. Initialize etmek lazimmis #lessenslearned
    init(data: Data) {
        id = UUID()
        title = data.title
        attendees = data.attendees
        lengthInMinutes = Int(data.lengthInMinutes)
        theme = data.theme
    }
}




extension DailyScrum {
    static let sampleData: [DailyScrum] =
    [
        DailyScrum(title: "Design", attendees: ["Cathy", "Daisy", "Simon", "Jonathan"], lengthInMinutes: 10, theme: .yellow),
        DailyScrum(title: "App Dev", attendees: ["katie", "Gray", "Euna", "Luis", "Darla"], lengthInMinutes: 5, theme: .orange),
        DailyScrum(title: "Web Dev", attendees: ["Chella", "Chris", "Shristina", "Eden", "Karla", "Lindsey", "Aga", "Chad", "Jenn", "Sarah"], lengthInMinutes: 5, theme: .poppy)
    ]
    
}
