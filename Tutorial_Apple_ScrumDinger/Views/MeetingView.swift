//
//  ContentView.swift
//  Tutorial_Apple_ScrumDinger
//
//  Created by Sedat Onat on 3.10.2022.
//


import SwiftUI
import AVFoundation

struct MeetingView: View {
    
    @Binding var scrum: DailyScrum // bu kisim olmadan hata verdi "Cannot find 'scrum' in scope"
    @StateObject var scrumTimer = ScrumTimer()
    
    private var player: AVPlayer { AVPlayer.sharedDingPlayer }
    
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(scrum.theme.mainColor)
            VStack {
                MeetingHeaderView(secondsElapsed: scrumTimer.secondsElapsed, secondsRemaining: scrumTimer.secondsRemaining, theme: scrum.theme)
                // Circle() .strokeBorder(lineWidth:24) // bu kisim taslak olarak konumustu. Nasil bir goruntu olacagina dair. Sonra ise MeetingTimerView getirildi
                MeetingTimerView(speakers: scrumTimer.speakers, theme: scrum.theme)
                MeetingFooterView(speakers: scrumTimer.speakers, skipAction: scrumTimer.skipSpeaker)
            }
        }
        .padding()
        .foregroundColor(scrum.theme.accentColor)
        .onAppear {
            scrumTimer.reset(lengthInMinutes: scrum.lengthInMinutes, attendees: scrum.attendees)
            scrumTimer.speakerChangedAction = {
                player.seek(to: .zero)
                player.play()
            }
            scrumTimer.startScrum() } // ekrana gelir gelmez timer 'lari sifirla
        .onDisappear {
            scrumTimer.stopScrum()
            let newHistory = History(
                attendees: scrum.attendees,
                lengthInMinutes: scrum.timer.secondsElapsed / 60)
            scrum.history.insert(newHistory, at:0)
        }
        .navigationBarTitleDisplayMode(.inline) // Bu ne ise yaradi anlamadim #learn
}
}


struct MeetingView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingView(scrum: .constant(DailyScrum.sampleData[0]))
        // sampledata yazinca hata verdi cunku "D" kucuk yazilmisti #lessonslearned
    }
}
