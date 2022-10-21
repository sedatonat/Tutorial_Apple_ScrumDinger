//
//  MeetingHeaderView.swift
//  Tutorial_Apple_ScrumDinger
//
//  Created by Sedat Onat on 16.10.2022.
//

import SwiftUI

struct MeetingHeaderView: View {
    let secondsElapsed: Int
    let secondsRemaining: Int
    let theme: Theme
        
    private var totalSeconds: Int {
        secondsElapsed + secondsRemaining
    }
    
    private var progress: Double {
        guard totalSeconds > 0 else { return 1 }
        return Double(secondsElapsed) / Double(totalSeconds)
    }
    
    private var minutesRemaining: Int {
        secondsRemaining / 60
    }
    
    
    var body: some View {
        
        VStack {
            ProgressView(value:progress)
                .progressViewStyle(ScrumProgressViewStyle(theme: theme)) // Bu kisim Section 2 de atlanmis. #feedback2Apple
            HStack{
                VStack (alignment: .leading) {
                    Text("Seconds Elapsed")
                        .font(.caption)
                        .padding(.bottom,0) //bunu ekstra ekledim
                    Label("\(secondsElapsed)", systemImage: "hourglass.bottomhalf.fill")
                }
                Spacer()
                VStack (alignment: .trailing) {
                    Text("Seconds Remaining")
                        .font(.caption)
                    Label("\(secondsRemaining)", systemImage: "hourglass.tophalf.filled")
                        .labelStyle(.trailingIcon) // ikonu saga atti
                }
            }
        } // VStack eklenmeden evvel asagidakile gorunmuyordu. Layer lara dikkat etmek gerekli. bir layer digerini ezebiliyor. #learn
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Time remaining")
        .accessibilityValue("\(minutesRemaining) minutes")
        .padding([.top, .horizontal])
        
    }
}

struct MeetingHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MeetingHeaderView(secondsElapsed: 60, secondsRemaining: 180, theme: .bubblegum) // buradaki .theme kismi atlanmis Section 2-3 arasinda #feedback2Apple
            .previewLayout(.sizeThatFits)
    }
}
