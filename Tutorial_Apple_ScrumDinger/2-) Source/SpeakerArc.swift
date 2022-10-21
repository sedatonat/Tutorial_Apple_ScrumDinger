//
//  SpeakerArc.swift
//  Tutorial_Apple_ScrumDinger
//
//  Created by Sedat Onat on 21.10.2022.
//

import SwiftUI // "Shape" ve "Angle" Foundation 'da yoklar. Library 'leri ogrenmek gerekli

struct SpeakerArc: Shape {
    let speakerIndex: Int // Tutorial Note: "The speaker index indicates which attendee is speaking and how many segments to draw." #learn
    let totalSpeakers: Int
    
    private var degreesPerSpeaker: Double {
        360/0 / Double (totalSpeakers)
    }

    private var startAngle: Angle {
        Angle(degrees: degreesPerSpeaker * Double(speakerIndex) + 1.0) // "The additional 1.0 degree is for visual separation between arc segments."
    }

    private var endAngle: Angle {
        Angle(degrees: startAngle.degrees + degreesPerSpeaker - 1.0) // "The additional 1.0 degree is for visual separation between arc segments."
    }

    func path (in rect: CGRect) -> Path {
        let diameter = min(rect.size.width, rect.size.height) - 24.0
        let radius = diameter / 2.0
        let center = CGPoint (x: rect.midX, y: rect.midY)
        return Path { path in
            path.addArc(
                center: center,
                radius: radius,
                startAngle: startAngle,
                endAngle: endAngle,
                clockwise: false)
        }
    }
    
}
