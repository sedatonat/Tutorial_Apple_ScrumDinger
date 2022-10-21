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
            .overlay {
                ForEach(speakers) { speaker in
                    if speaker.isCompleted, let index = speakers.firstIndex(where: { $0.id == speaker.id}) {
                        // Konusmasini bitirip bitirmedigini kontrol ediyor
                        SpeakerArc(speakerIndex: index, totalSpeakers: speakers.count)
                            .rotation(Angle(degrees: -90)) // saat 12 pozisyonuna getiriyor
                            .stroke(theme.mainColor, lineWidth: 12) // "The stroke modifier traces a line along the path of the shape."
                    
                    }
                }
            }
            .padding(.horizontal)
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
