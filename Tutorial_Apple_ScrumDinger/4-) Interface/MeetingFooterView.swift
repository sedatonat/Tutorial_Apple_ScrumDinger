//
//  MeetingFooterView.swift
//  Tutorial_Apple_ScrumDinger
//
//  Created by Sedat Onat on 16.10.2022.
//

import SwiftUI

struct MeetingFooterView: View {
    let speakers: [ScrumTimer.Speaker] // neden buradan aliyor? #learn
    var skipAction: ()->Void // secim yapmadan diger konusmaciya gecmeyi sagliyor #note
    
    // Aktif konusmaci sayisi. Ama isCompleted nereden aliyor anlamadim. #learn
    private var speakerNumber: Int? {
        guard let index = speakers.firstIndex(where: {!$0.isCompleted})
        else { return nil }
        return index + 1
    }
    
    private var isLastSpeaker: Bool {
        return speakers.dropLast().allSatisfy { $0.isCompleted }
    }
    // private var speakers.dropLast().reduce(true) { $0 && $1.isCompleted }
    // Tutorial 'da bunu 2nci alternatif olarak gostermis ama nasil calistigini anlamadim. #learn
    
    
    // Konusmaci sayisi
    private var speakerText: String {
        guard let speakerNumber = speakerNumber else { return "No more speakers"}
        return "Speaker \(speakerNumber) of \(speakers.count)"
    }
    
    
    var body: some View {
        VStack {
            HStack {
                if isLastSpeaker {
                    Text("Last Speaker")
                } else {
                    Text(speakerText)
                    Spacer()
                    Button(action:skipAction) {
                        Image(systemName:"forward.fill")
                    }
                    .accessibilityLabel("Next Speaker")
                }
            }
        }
        .padding([.bottom, .horizontal])
    }
}

struct MeetingFooterView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingFooterView(speakers: DailyScrum.sampleData[0].attendees.speakers, skipAction:{})
            .previewLayout(.sizeThatFits)
    }
}
