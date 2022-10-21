//
//  MeetingTimerView.swift
//  Tutorial_Apple_ScrumDinger
//
//  Created by Sedat Onat on 21.10.2022.
//

import SwiftUI

struct MeetingTimerView: View {
    let speakers: [ScrumTimer.Speaker]
    let theme: Theme
    
    // currentSpeaker is a computed property #learn
    private var currentSpeaker: String {
        speakers.first(where: { !$0.isCompleted })?.name ?? "Someone" // Eger currentSpeaker yok ise "Someone" yazsin. Nedne if ile yazilmadi? #learn
    }
    
    
    var body: some View {
        Circle()
            .strokeBorder(lineWidth: 24)
            .overlay {
                VStack {
                    Text(currentSpeaker)
                    // Text(speakers.first) Bu niye olmadi? #learn
                    // VStack {Text("\(ScrumTimer.Speaker)")} Bu niye olmadi? #learn
                        .font(.title)
                    Text("is speaking")
                }
                .accessibilityElement(children: .combine)
                .foregroundStyle(theme.accentColor)
            }
    }
    
    
}


struct MeetingTimerView_Previews: PreviewProvider {
    static var speakers: [ScrumTimer.Speaker] {
        [
            ScrumTimer.Speaker(name: "Bill", isCompleted: true),
            ScrumTimer.Speaker(name: "Cathy", isCompleted: false)
        ]
    }
    
    static var previews: some View {
        MeetingTimerView(speakers: speakers, theme: .yellow)
    }
    
}
