//
//  HistoryView.swift
//  Tutorial_Apple_ScrumDinger
//
//  Created by Sedat Onat on 22.10.2022.
//

import SwiftUI

struct HistoryView: View {
    let history: History
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Divider()
                    .padding(.bottom)
                Text("Attendees")
                    .font(.headline)
                Text(history.attendeeString)
                
                if let transcript = history.transcript {
                    Text("Transcript")
                        .font(.headline)
                        .padding(.top)
                    Text(transcript)
                }
                
            }
        }
        .navigationTitle(Text(history.date,style: .date))
        .padding()
    }
}

// Bu kismi hic anlamadim. Evvela basta tanitmadigimiz bir kisim nasil sonradan tanitilabiliyor? #learn
extension History {
    var attendeeString: String {
        ListFormatter.localizedString(byJoining: attendees.map { $0.name })
    }
}



struct HistoryView_Previews: PreviewProvider {
    static var history: History {
        History(
            attendees: [DailyScrum.Attendee(name: "Jon"),
                        DailyScrum.Attendee(name: "Daria"),
                        DailyScrum.Attendee(name: "Luis"),
                        DailyScrum.Attendee(name: "Jon")],
            lengthInMinutes: 10,
            transcript: "Darla, would you like to start today? Sure, yesterday I reviewed Luis' PR and met with the design team to finalize the UI..."
        )
    }
    
    
    
    static var previews: some View {
        HistoryView(history: history)
    }
}
