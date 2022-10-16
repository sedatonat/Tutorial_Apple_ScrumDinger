//
//  ContentView.swift
//  Tutorial_Apple_ScrumDinger
//
//  Created by Sedat Onat on 3.10.2022.
//

import SwiftUI

struct MeetingView: View {
    
    @Binding var scrum: DailyScrum // bu kisim olmadan hata verdi "Cannot find 'scrum' in scope"
    @StateObject var scrumTimer = ScrumTimer()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(scrum.theme.mainColor)
            VStack {
                MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed, secondsRemaining: scrumTimer.secondsRemaining, theme: scrum.theme)
                Circle()
                    .strokeBorder(lineWidth:24)
                MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
            }
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
        .onAppear {
            scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
            scrumTimer.startScrum() } // ekrana gelir gelmez timer 'lari sifirla
        .onDisappear { scrumTimer.stopScrum() }
        .navigationBarTitleDisplayMode(.inline) // Bu ne ise yaradi anlamadim #learn
}
}


struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView(scrum: .constant(DailyScrum.sampleData[0]))
        // sampledata yazinca hata verdi cunku "D" kucuk yazilmisti #lessonslearned
    }
}
